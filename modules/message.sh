function message {
  chats="$1"
  function check_apitoken {
    channelname=$1
    access_token=$(config | grep "$channelname" | cut -d "=" -f2)
    if [[ $access_token == "" ]] || [[ $access_token == "null" ]]; then
      return 1
    else
      return 0
    fi
  }
  function get_apitoken {
    channelname=$1
    access_token=$(config | grep "$channelname" | grep "token" | cut -d "=" -f2)
    echo "Your API access token is $access_token"
    return 0
  }
  function check_group {
    group=$1
    group_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms")
    group_names=($(echo $group_info | python -m json.tool | jq '.[].name' | tr -d '"'))
    for i in "${group_names[@]}"; do
      if [[ $i == "$group" ]]; then
        return 0
        break
      fi
    done
    return 1
  }
   case "$chats" in
    gitter)
      case "$2" in
        apitoken)
          if check_apitoken gitter; then
            get_apitoken gitter
          elif [[ $3 != "" ]] && [[ $4 != "" ]]; then
            client_id=$3
            if [[ $4 == http?(s)://* ]]; then
              redirect_uri=$4
            else
              log_and_exit1 "Invalid URL"
            fi
            conf_var_update "client_id" "$client_id"
            conf_var_update "redirect_url" "$redirect_uri"
            echo "Navigate to  https://gitter.im/login/oauth/authorize?client_id=$client_id&response_type=code&redirect_uri=$redirect_uri"
            echo "Click 'Allow' and get the code at the end of the redirect link:"
            echo "Example:redirect link: http://www.localhost.com/?code=1234567890, code=1234567890"
            echo "run $BASENAME message gitter authorize <code> <0auth Secret>"
          else
            echo "You do not have an authorized access token"
            echo "To get an authorized access token"
            echo "Navigate to https://developer.gitter.im/apps and signin"
            echo "Create a new app and provide aplication name and a redirect url where you will be send after authorization"
            echo "After creating your app, you will be provided a oauth key, a oauth secret and the redirect URL"
            echo "Run $BASENAME message gitter apitoken <oauth key> <redirect url>"
            echo "Click 'Allow' and get the code at the end of the redirect link:"
            echo "Example: If redirect link is \"http://www.localhost.com/?code=1234567890\",then \"code=1234567890\""
            echo "Run $BASENAME message gitter authorize <code> <oauth Secret>"
          fi
          ;;
        authorize)
          if [[ $3 == "" ]]; then
            echo "authorization code is missing"
          elif [[ $4 == "" ]]; then
             echo "oauth secret is missing"
          else
            code=$3
            client_key=$4
            conf_var_update "client_key" "$client_key"
            client_id=$(config | grep "$client_id" | cut -d "=" -f2)
            redirect_uri=$(config | grep "$redirect_url" | cut -d "=" -f2)
            api_info=$(curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" "https://gitter.im/login/oauth/token" -d '{"client_id": "'$client_id'", "client_secret": "'$client_key'", "code": "'$code'", "redirect_uri": "'$redirect_uri'", "grant_type": "authorization_code"}')
            token_info=$(echo $api_info | python -m json.tool | jq '.access_token' | tr -d '"')
            conf_var_update "gitter_access_token" "$token_info"
            echo "Your API access token is $token_info"
          fi
          ;;
        send)
          group=$3
          if check_apitoken gitter; then
            if [[ $3 == "" ]]; then
              log_comment_and_exit1 "ERROR: Group information is missing" "usage: $BASENAME message gitter send <group>"
            elif ! check_group $group; then
              log_and_exit1 "You are not part of this group"
            else
              curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}'>"$LOGFILE"
              channelinfo=$(curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}')
              #finds channel id and removes double quotes
              channelid=$(echo $channelinfo | python -m json.tool | jq '.id' | tr -d '"')
              shift; shift; shift;
              message="$*"
              if ! [[ -z "$message" ]]; then
                body="{\"text\":\"\n$message\"}"
                channel=https://api.gitter.im/v1/rooms/$channelid/chatMessages
                curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "$channel" -d "$body"> "$LOGFILE"
                echo "Thanks for the message!"
              else
                log_and_exit1 "No message was submitted."
              fi
            fi
          else
            log_comment_and_exit1 "Error:You do not have an authorized access token" "To get access token, run $BASENAME message gitter apitoken"
          fi
          ;;
        show)
          group=$3
          if check_apitoken gitter; then
            if [[ $group == "" ]]; then
              log_comment_and_exit1 "ERROR: Group information is missing" "usage: $BASENAME message gitter send <group>"
            elif ! check_group $group; then
              log_and_exit1 "You are not part of this group"
            else
              curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}'>"$LOGFILE"
              channelinfo=$(curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}')
              #finds channel id and removes double quotes
              channelid=$(echo $channelinfo | python -m json.tool | jq '.id' | tr -d '"')
              user_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user")
              user_id=$(echo $user_info | python -m json.tool | jq '.[].id' | tr -d '"')
              i=0
              length=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems" | python -m json.tool | jq '.chat | length')
              if [ $length == 0 ];then
                echo "You have no unread messages at the moment"
              fi
              unread_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems")
              while [ "$i" -lt $length ]; do
                message_id=$(echo $unread_info | python -m json.tool | jq '.chat['$i']' | tr -d '"')
                message_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms/$channelid/chatMessages/$message_id")
                message=$(echo $message_info | python -m json.tool | jq '.text')
                from_name=$(echo $message_info | python -m json.tool | jq '.fromUser.displayName' | tr -d '"')
                from_user=$(echo $message_info | python -m json.tool | jq '.fromUser.username' | tr -d '"')
                sent_time=$(echo $message_info | python -m json.tool | jq '.sent' | tr -d '"')
                #displays message
                echo "From: $from_name@$from_user"
                echo "Message: $message"
                echo "Sent: $sent_time"
                i=$((i+1))
              done
            fi
          else
            log_comment_and_exit1 "Error: You do not have an authorized access token" "To get access token, run $BASENAME message gitter apitoken"
          fi
          ;;
        read)
          group="$3"
          if check_apitoken gitter; then
            if [[ $group == "" ]]; then
              log_comment_and_exit1 "ERROR: Group information is missing" "usage: $BASENAME message gitter send <group>"
            elif ! check_group $group; then
              log_and_exit1 "You are not part of this group"
            else
              curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}'>"$LOGFILE"
              channelinfo=$(curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}')
              #finds channel id and removes double quotes
              channelid=$(echo $channelinfo | python -m json.tool | jq '.id' | tr -d '"')
              user_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user")
              user_id=$(echo $user_info | python -m json.tool | jq '.[].id' | tr -d '"')
              i=0
              length=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems" | python -m json.tool | jq '.chat | length')
              if [ $length == 0 ];then
               echo "You have no unread messages at the moment"
              fi
              unread_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems")
              while [ "$i" -lt $length ]; do
                message_id=$(echo $unread_info | python -m json.tool | jq '.chat['$i']' | tr -d '"')
                message_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms/$channelid/chatMessages/$message_id")
                message=$(echo $message_info | python -m json.tool | jq '.text')
                from_name=$(echo $message_info | python -m json.tool | jq '.fromUser.displayName' | tr -d '"')
                from_user=$(echo $message_info | python -m json.tool | jq '.fromUser.username' | tr -d '"')
                sent_time=$(echo $message_info | python -m json.tool | jq '.sent' | tr -d '"')
                curl -X POST -s -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems" -d '{"chat":["'$message_id'"]}' > "$LOGFILE"
                #displays message
                echo "From: $from_name@$from_user"
                echo "Message: $message"
                echo "Sent: $sent_time"
                i=$((i+1))
              done
            fi
          else
            log_comment_and_exit1 "Error: You do not have an authorized access token" "To get access token, run $BASENAME message gitter apitoken"
          fi
          ;;
        mark)
          group="$3"
          if check_apitoken gitter; then
            if [[ $group == "" ]]; then
              log_comment_and_exit1 "ERROR: Group information is missing" "usage: $BASENAME message gitter send <group>"
            elif ! check_group $group; then
              log_and_exit1 "You are not part of this group"
            else
              curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}'>"$LOGFILE"
              channelinfo=$(curl -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/rooms" -d '{"uri":"'$group'"}')
              #finds channel id and removes double quotes
              channelid=$(echo $channelinfo | python -m json.tool | jq '.id' | tr -d '"')
              user_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user")
              user_id=$(echo $user_info | python -m json.tool | jq '.[].id' | tr -d '"')
              i=0
              length=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems" | python -m json.tool | jq '.chat | length')
              if [ $length == 0 ];then
                echo "You have no unread messages at the moment"
              fi
              unread_info=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems")
              while [ "$i" -lt $length ]; do
                message_id=$(echo $unread_info | python -m json.tool | jq '.chat['$i']' | tr -d '"')
                curl -X POST -s -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $access_token" "https://api.gitter.im/v1/user/$user_id/rooms/$channelid/unreadItems" -d '{"chat":["'$message_id'"]}' > "$LOGFILE"
                i=$((i+1))
              done
            fi
          else
            log_comment_and_exit1 "Error: You do not have an authorized access token" "To get access token, run $BASENAME message gitter apitoken"
          fi
          ;;
        *)
          log_help_and_exit1 "Error: This command does not exist" message
          ;;
      esac
      ;;
    slack)
      case "$2" in
        apitoken)
          if [[ $3 != "" ]]; then
            tempVar=$(echo $3 | cut -d "-" -f 1)
            if [[ $tempVar == "xoxp" ]]; then
              conf_var_update "slack_apitoken" "$3"
              echo "your apitoken is $3"
            else
              log_comment_and_exit1 "invalid token"
            fi
          elif check_apitoken slack; then
            get_apitoken slack
          else
            echo "You do not have an authorized access token for slack"
            echo ""
            echo "To get an authorized access token"
            echo "Navigate to https://api.slack.com/apps and create an APP. Provide a name for the APP and select the \"Development Slack Workspace (eg : Open Learning Exchange)\" from the drop down list"
            echo "Go to \"OAuth & Permission\" under \"features \" and select the scope under \"User Token Scopes\" and add \"chat:write\" for the APP from the drop down list"
            echo "Then install APP to the workspace and click the allow button to give permissions in the redirected link and then you will get the \"OAuth access token\""
            echo "Run $BASENAME message slack apitoken <oauth access token>"
          fi
          ;;
        checkchannels)
          if check_apitoken slack; then
            list=$(curl -s -F token=$access_token https://slack.com/api/conversations.list)
            channel_names=$(echo $list | python -m json.tool | jq '.channels[].name' | tr -d '"')
            echo "Channels names:"
            echo "$channel_names"
          else
            echo "You do not have an authorized access token for slack"
            echo ""
            echo "To get an authorized access token"
            echo "Navigate to https://api.slack.com/apps and create an APP. Provide a name for the APP and select the \"Development Slack Workspace (eg : Open Learning Exchange)\" from the drop down list"
            echo "Go to \"OAuth & Permission\" under \"features \" and select the scope under \"User Token Scopes\" and add \"chat:write\" for the APP from the drop down list"
            echo "Then install APP to the workspace and click the allow button to give permissions in the redirected link and then you will get the \"OAuth access token\""
            echo "Run $BASENAME message slack apitoken <oauth access token>"
          fi
          ;;
        send)
          channel=$3
          if check_apitoken slack; then
            if [[ $3 == "" ]]; then
              log_comment_and_exit1 "ERROR: Group information is missing" "usage: $BASENAME message slack send <group>"
            fi
            shift; shift; shift;
            message=$*
            message_response=$(curl -s -X POST -H 'Authorization: Bearer '$access_token'' -H 'Content-type: application/json' --data "{\"channel\":\"$channel\",\"text\":\"$message\"}" https://slack.com/api/chat.postMessage)
            message_response=$(echo $message_response | python -m json.tool | jq '.ok' | tr -d '"')
            if [[ $message_response == "true" ]]; then
              echo "message successfully delivered to $channel"
            else
              log_comment_and_exit1 "ERROR: message not delivered"
            fi
          else
            log_comment_and_exit1 "Error:You do not have an authorized access token" "To get access token, run $BASENAME message slack apitoken"
          fi
          ;;
        *)
          log_help_and_exit1 "Error: This command does not exist" message
      esac
      ;;
    *)
      log_help_and_exit1 "Error: This command does not exist" message
      ;;
  esac
}

function message_help {
  echo
  echo "Usage: $BASENAME message <chats> <apitoken>|<oauth key> <redirect URL> | <authorize> <code> <oauth secret>| send <group> <message> | show|read|mark <group>"
  echo
  echo "You can get your token from https://developer.gitter.im/docs/welcome by signing in, it should show up immediately or by navigating to https://developer.gitter.im/apps"
  echo
  echo "You must set your api key at least once every session before sending a message"
  echo
  echo "Sends message to a chat service"
  echo
  echo "Example:"
  echo
  echo "  $BASENAME message gitter apitoken"
  echo "     check for API token for gitter"
  echo
  echo "  $BASENAME message gitter authorize \"1234567890\""
  echo "     sets and saves API token"
  echo
  echo "  $BASENAME message gitter send treehouses/Lobby \"Hi, you are very awesome\""
  echo "     Sends a message to a gitter channel"
  echo
  echo "  $BASENAME message gitter show treehouses/Lobby"
  echo "     Marks unread messages from a gitter channel to read"
  echo
  echo "  $BASENAME message gitter read treehouses/Lobby"
  echo "     Receives and displays unread messages from a gitter channel"
  echo
  echo "  $BASENAME message gitter mark treehouses/Lobby"
  echo "     Marks unread messages from a gitter channel to read"
  echo
  echo "  $BASENAME message slack apitoken"
  echo "     check for API token for slack"
  echo
  echo "  $BASENAME message slack checkchannels"
  echo "     check for the channels of user"
  echo
  echo "  $BASENAME message slack send \"channel_name or channel ID\" \"Hi, you are very awesome\""
  echo "     Sends a message to a slack channel using channel name, eg, channel: #channel_name"
  echo
}
