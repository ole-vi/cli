function remote {
  local option results
  checkroot
  checkrpi
  option="$1"

  if [ "$option" = "status" ]; then
    checkargn $# 1
    echo "$(internet) $(bluetooth mac) $(image) $(version) $(detectrpi)"
  elif [ "$option" = "upgrade" ]; then
    checkargn $# 1
    upgrade --check
  elif [ "$option" = "services" ]; then
    checkargn $# 2
    if [ "$2" = "available" ]; then
      echo "Available: $(services available)"
    elif [ "$2" = "installed" ]; then
      echo "Installed: $(services installed)"
    elif [ "$2" = "running" ]; then
      echo "Running: $(services running)"
    fi
  elif [ "$option" = "version" ]; then
    checkargn $# 2
    if [ -z "$2" ]; then
      echo "version number required"
      echo "usage: $BASENAME remote version <version_number>"
      exit 1
    fi
    if ! [[ "$2" =~ ^[0-9]+$ ]]; then
      echo "Error: not a number"
      exit 1
    fi
    if [ "$2" -ge "$(node -p "require('$SCRIPTFOLDER/package.json').remote")" ]; then
      echo "version: true"
    else
      echo "version: false"
    fi
  elif [ "$option" = "commands" ]; then
    checkargn $# 2
    source $SCRIPTFOLDER/_treehouses && _treehouses_complete 2>/dev/null
    if [ -z "$2" ]; then
      echo "$every_command"
    elif [ "$2" = "json" ]; then
      while IFS= read -r line;
      do
        cmd_str+="\"$line\","
      done <<< "$every_command"
      printf "{\"commands\":["%s"]}\n" "${cmd_str::-1}"
    else
      echo "Error: incorrect command"
      echo "Usage: $BASENAME remote commands [json]"
      exit 1
    fi
  elif [ "$option" = "allservices" ]; then
    checkargn $# 1
    json_fmt="{\"available\":["%s"],\"installed\":["%s"],\"running\":["%s"],\"icon\":{"%s"},\"info\":{"%s"},\"autorun\":{"%s"}}\n"

    available_str=$(services available | sed 's/^\|$/"/g' | paste -d, -s)
    installed_str=$(services installed | sed 's/^\|$/"/g' | paste -d, -s)
    running_str=\"$(services running | tr ' ' ',')\"
    running_str=${running_str//,/\",\"}

    available=($(services available))
    for i in "${available[@]}"
    do
      icon_str+="\"$i\":\"$(services $i icon oneline | sed 's/"/\\"/g')\","
      info_str+="\"$i\":\"$(services $i info | tr '\n' ' ' | sed 's/"/\\"/g')\","
      autorun_str+="\"$i\":\"$(services $i autorun)\","
    done

    printf "$json_fmt" "$available_str" "$installed_str" "$running_str" "${icon_str::-1}" "${info_str::-1}" "${autorun_str::-1}"
  else
    echo "unknown command option"
    echo "usage: $BASENAME remote [status | upgrade | services | version | commands | allservices]"
  fi
}

function remote_help {
  echo
  echo "Usage: $BASENAME remote [status | upgrade | services | version | commands | allservices]"
  echo
  echo "Returns a string representation of the current status of the Raspberry Pi"
  echo "Used for Treehouses Remote"
  echo
  echo "$BASENAME remote status"
  echo "<internet> <bluetooth mac> <image> <version> <detectrpi>"
  echo "     │            │           │        │          │"
  echo "     │            │           │        │          └── model number of rpi"
  echo "     │            │           │        └───────────── current cli version"
  echo "     │            │           └────────────────────── current treehouses image version"
  echo "     │            └────────────────────────────────── bluetooth mac address"
  echo "     └─────────────────────────────────────────────── internet connection status"
  echo
  echo "$BASENAME remote upgrade"
  echo "true if an upgrade is available"
  echo "false otherwise"
  echo
  echo "$BASENAME remote services [available | installed | running]"
  echo "Available: | Installed: | Running: <list of services>"
  echo
  echo "$BASENAME remote version <version_number>"
  echo "true if <version_number> >= \"remote_min_version\" in package.json"
  echo "false otherwise"
  echo
  echo "$BASENAME remote commands [json]"
  echo "returns a list of all commands for tab completion"
  echo
  echo "$BASENAME remote allservices"
  echo "returns json string of services"
  echo
}
