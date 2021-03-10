function internet {
  checkargn $# 1

  case "$1" in
  "")
    if nc -w 10 -z 8.8.8.8 53 >/dev/null 1>&2; then
      echo "true"
      exit 0
    fi
    echo "false"
    ;;
  "reverse")
    if ! nc -w 10 -z 8.8.8.8 53 >/dev/null 1>&2; then
      log_and_exit1 "Error: no internet found"
    fi
    info="$(curl -s ipinfo.io | grep -o '"[^"]*"\s*:\s*"[^"]*"')"

    postal=$(echo "$info" | grep -E '"(postal)"') #assigns postal value

    echo "$info" | grep -E '"(ip)"'

    if [ -z "$postal" ]; then #if no postal, echoes n/a for postal
      echo -n "$info" | grep -E '"(city|country)"' | tr '\n' ',' | sed 's/,$/\n/' | sed 's/\",\"/\", \"/g'
      echo ', "postal": "n/a"'
    else
      echo "$info" | grep -E '"(city|country|postal)"' | tr '\n' ',' | sed 's/,$/\n/' | sed 's/\",\"/\", \"/g'
    fi

    echo "$info" | grep -E '"(org|timezone)"'
    ;;
  *)
    log_help_and_exit1 "ERROR: incorrect command" internet
    ;;
  esac
}

function internet_help {
  echo
  echo "Usage: $BASENAME internet [reverse]"
  echo
  echo "Outputs true if the rpi can reach internet, or false if it doesn't"
  echo
  echo "Example:"
  echo "  $BASENAME internet"
  echo "      the rpi has access to internet -> output: true"
  echo "      the rpi doesn't have access to internet -> output: false"
  echo
  echo "  $BASENAME internet reverse"
  echo "      this outputs the device's internet location information"
  echo
}
