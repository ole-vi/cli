#!/bin/bash

function memory_total() {
  option=$1
  case $option in 
    '-g')
      t_M=$(free -m | grep -i Mem | awk '{printf $2}')
      t=$(echo "scale=2;$t_M/1024" | bc)
      ;;
    '-m')
      t=$(free -m | grep -i Mem | awk '{printf $2}')
      ;;
    *)
      t=$(free | grep -i Mem | awk '{printf $2}')
      ;;
  esac
}

function memory() {

    if [ "$1" == "total" ] ; then
    memory_total $2
    echo "$t";
    exit 0
  fi

  if [ "$1" == "used" ] ; then
    memory_used $2
    echo "$ubc";
    exit 0
  fi

  if [ "$1" == "free" ] ; then
    memory_free $2
    echo "$f";
    exit 0
  fi
    

 option=$1
 case $option in
    '-g')
      memory_total '-g'
      memory_used '-g' 
      memory_free '-g' 
      echo "Your rpi has $t gigabytes of total memory with $ubc gigabytes used and $f gigabytes avalaible"
      ;;
    '-m')
      memory_total '-m'
      memory_used '-m' 
      memory_free '-m' 
      echo "Your rpi has $t megabytes of total memory with $ubc megabytes used and $f megabytes avalaible"
      ;;
    *)
      if [ ! -n "$1" ]; then
        option='-m'
      else 
	if [ ! "$1" == 'total' ] && [ ! "$1" == 'used' ] && [ ! "$1" == 'free' ]; then    
          echo "Error: Ony '-g' and '-m' argument accepted"
          exit 1
	fi
      fi
      memory_total "$option"
      memory_used "$option"
      memory_free "$option" 
      echo "Your rpi has $t megabytes of total memory with $ubc megabytes used and $f megabytes avalaible"
  esac
}

function memory_used {
  option=$1
  case $option in 
    '-g')
      u_M=$(free -m | grep -i Mem | awk '{printf $3}')
      u=$(echo "scale=2;$u_M/1024" | bc)
      bc_M=$(free -m | grep -i Mem | awk '{printf $6}')
      bc=$(echo "scale=2;$bc_M/1024" | bc)
      ubc=u+bc|bc
      #ubc=$( (u+bc) | bc )
      ;;
    '-m')
      u=$(free -m | grep -i Mem | awk '{printf $3}')
      bc=$(free -m | grep -i Mem | awk '{printf $6}')
      ubc=$((u+bc))
      ;;
    *)
      u=$(free | grep -i Mem | awk '{printf $3}')
      bc=$(free | grep -i Mem | awk '{printf $6}')
      ubc=$((u+bc))
      ;;
  esac
}

function memory_free {
  option=$1
  case $option in 
    '-g')
      f_G=$(free -m | grep -i Mem | awk '{printf $4}')
      f=$(echo "scale=2;$f_G/1024" | bc)
      ;;
    '-m')
      f=$(free -m | grep -i Mem | awk '{printf $4}')
      ;; 
    *)
      f=$(free | grep -i Mem | awk '{printf $4}')
      ;;
  esac
}

function memory_help {
  echo ""
  echo "Usage: $(basename "$0") memory [total|used|free] [-g|-m]"
  echo ""
  echo "Displays the various values for total, used, and free RAM memory."
  echo ""
  echo "Example:"
  echo "  $(basename "$0") memory"
  echo "      This will display in a single sentence 3 different RAM memory values in bytes for total, used and free memory."
  echo ""
  echo "  $(basename "$0") memory -g"
  echo "      This will display in a single sentence 3 different RAM memory values in bytes for total, used and free memory."
  echo ""


  echo "  $(basename "$0") memory total"
  echo "      This will return the numerical value for the total memory (value in bytes)."
  echo ""
  echo "  $(basename "$0") memory used"
  echo "      This will return the numerical value for the used memory (value in bytes)."
  echo ""
  echo "  $(basename "$0") memory free"
  echo "      This will return the numerical value for the remaining free memory (value in bytes)."
  echo ""
}
