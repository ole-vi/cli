#!/bin/bash

function coralenv {
  param=$1
  
  if [ ! -d /usr/share/doc/python3-coral-enviro ] ; then
    warn "Error: the Coral python environment is not installed"
    while true; do
      read -n 1 -pr "Do you want to install the prerequisite packages for the Coral Environmental Board? (y/n)" answer
      case "$answer" in
        "y"* ) echo "deb https://packages.cloud.google.com/apt coral-cloud-stable main" | tee /etc/apt/sources.list.d/coral-cloud.list;
               curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -;
               sudo apt update;
               sudo apt upgrade;
               sudo apt install -y python3-coral-enviro;
               reboot_needed;
                 while reboot_needed; do
                   read -n 1 -pr "Would you like to reboot now? (y/n)" answerreboot;
                     case "$answerreboot" in
                       "y"* ) reboot;;
                       "n"* ) exit 1;;
                      * ) exit 1;;
                     esac
                 done
               exit 1;;
        "n"* ) echo "To install them manually, run:";    
               echo "echo \"deb https://packages.cloud.google.com/apt coral-cloud-stable main\" | sudo tee /etc/apt/sources.list.d/coral-cloud.list"
               echo "curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -"
               echo "sudo apt update"
               echo "sudo apt upgrade"
               echo "sudo apt install python3-coral-enviro"
               exit 1;;
        * ) echo "Please answer (y)es or (n)o.";;
      esac
    done
  fi

# Start the demo until next reboot
  if [ "$param" = "demoon" ]; then
    python3 /usr/lib/python3/dist-packages/coral/enviro/enviro_demo.py & 
    echo "Success: the Coral Environmental board is now displaying sensor information."
    echo "The board's display will turn off on reboot." 

# Starts the demo, and activates it on reboot
  elif [ "$param" = "demoalwayson" ]; then
    nohup python3 /usr/lib/python3/dist-packages/coral/enviro/enviro_demo.py &>/dev/null &
    sed -i 's/exit 0/python3 \/usr\/lib\/python3\/dist-packages\/coral\/enviro\/enviro_demo\.py \&/' /etc/rc.local
    sed -i '$ a exit 0' /etc/rc.local
    echo "Success: the Coral Environmental board is now displaying sensor information."
    echo "The board's display will persist on reboot." 
 
# Stops the demo and deactivates it on reboot
  elif [ "$param" = "demooff" ]; then
     sed -i '/python3 \/usr\/lib\/python3\/dist-packages\/coral\/enviro\/enviro_demo\.py \&/d' /etc/rc.local
     pkill enviro_demo    
     echo "Success: the Coral Environmental board demo is now stopped."
     echo "The board's display will turn off on reboot." 
    
# Prints the help page.
  elif [ "$param" = "help" ]; then
    echo ""
    echo "Usage: $(basename "$0") coralenv <demoon|demoalwayson|demooff|help>"
    echo ""
    echo "Controls the Environmental Board"
    echo ""
    echo "Example:"
    echo "  $(basename "$0") coralenv demoon"
    echo "      Starts the Coral Environmental board demo."
    echo "      The Coral Environmental board will be displaying sensor information."
    echo "      The board's display will turn off on reboot."
    echo ""
    echo "  $(basename "$0") coralenv demoalwayson"
    echo "      Starts the Coral Environmental board demo."
    echo "      The board's display will persist on reboot."
    echo ""
    echo "  $(basename "$0") coralenv demooff"
    echo "      Stops the demo and the board's display will turn off on reboot."
    echo ""
    echo "  $(basename "$0") coralenv help"
    echo "      This help."
  
  else
    echo "Error: only 'demoon', 'demoalwayson', 'demoalwaysoff' and 'help' options are supported";
  fi
}

# Prints the options for the "coralenv" command
function coralenv_help {
  echo ""
  echo "Usage: $(basename "$0") coralenv <demoon|demoalwayson|demooff|help>"
  echo ""
  echo "Controls the Environmental Board"
  echo ""
  echo "Example:"
  echo "  $(basename "$0") coralenv demoon"
  echo "      Starts the Coral Environmental board demo."
  echo "      The Coral Environmental board will be displaying sensor information."
  echo "      The board's display will turn off on reboot."
  echo ""
  echo "  $(basename "$0") coralenv demoalwayson"
  echo "      Starts the Coral Environmental board demo."
  echo "      The board's display will persist on reboot."
  echo ""
  echo "  $(basename "$0") coralenv demooff"
  echo "      Stops the demo and the board's display will turn off on reboot."
  echo ""
  echo "  $(basename "$0") coralenv help"
  echo "      This help."
} 
