function changelog {
cp "/usr/lib/node_modules/@treehouses/cli/CHANGELOG.md" ../.
cp "/usr/lib/node_modules/@treehouses/cli/CHANGELOG.md" .
local LOGPATH displaymode version1 version2 CURRENT
CURRENT=$(treehouses version)
LOGPATH="$SCRIPTFOLDER/CHANGELOG.md"
checkargn $# 3
displaymode="$1"
version1="$2"
version2="$3"

if [ ! -f "$LOGPATH" ]; then
  log_and_exit1 "Error: file does not exist!"
fi

case "$displaymode" in
  view)
      checkargn $# 1
      view $LOGPATH
      ;;
  "")
      checkargn $# 0
      cat $LOGPATH
     ;;
  compare)
      case "$version1" in
      "")
        log_and_exit1 "Error: only 'compare [previous version]' and 'compare [previous version] [later version] are supported."
        ;;
      *)
        case "$version2" in
         "")
          checkargn $# 2
          if [[ dpkg --compare-versions "$CURRENT" "gt" "$version1" | echo $? -eq 0 ]]; then
            sed "/^### $CURRENT/!d;s//&\n/;s/.*\n//;:a;/^### $version1/bb;\$!{n;ba};:b;s//\n&/;P;D" $LOGPATH #grabs text between version numbers, print bottom to top
          else # Needs to specify previous version instead of current
            echo "ERROR: Must specify a previous version (less than $CURRENT)"
          fi
          ;;
        *)
          checkargn $# 3
          if [ dpkg --compare-versions "$version2" "gt" "$version1" ]; then
            sed "/^### $version2/!d;s//&\n/;s/.*\n//;:a;/^### $version1/bb;\$!{n;ba};:b;s//\n&/;P;D" $LOGPATH
          elif [ dpkg --compare-versions "$version2" "eq" "$version1" ]; then
            echo "ERROR: Must specify different versions for comparisons (cannot compare same version to itself)"
          else
            sed "/^### $version1/!d;s//&\n/;s/.*\n//;:a;/^### $version2/bb;\$!{n;ba};:b;s//\n&/;P;D" $LOGPATH
            echo "Did you mean: $BASENAME changelog compare $version2 $version1"
          fi
          ;;
        esac
        ;;
      esac
      ;;
  *)
    log_and_exit1 "Error: only 'view', 'compare' and blank options are supported."
    ;;
  esac
}

function changelog_help {
  CYAN='\033[1;36m'
  NC='\033[0m' #no color
  echo
  echo "Usage: $BASENAME changelog"
  echo "  Views the treehouses changelog generated by auto-changelog."
  echo
  echo "Usage: $BASENAME changelog view"
  echo "  Opens the raw changelog in vim read only mode."
  echo
  echo "Usage: $BASENAME changelog compare [previous version]"
  echo "  Displays all changes since a previous version to the current version."
  echo
  echo "Usage: $BASENAME changelog compare [previous version] [later version]"
  echo "  Displays all changes since a previous version to the version specified."
  echo
  echo "Example: $BASENAME changelog"
  echo
  echo -e "${CYAN}- \`treehouses services privatebin icon refactor\` [\`#1254\`](https://github.com/treehouses/cli/pull/1254)"
  echo
  echo "> 12 May 2020"
  echo
  echo "#### [1.20.22](https://github.com/treehouses/cli/compare/1.20.21...1.20.22)"
  echo
  echo -e "### Changelog${NC}"
}
