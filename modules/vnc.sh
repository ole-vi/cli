#!/bin/bash

function vnc {
  status=$1
  bootoptionstatus=$(sudo systemctl is-enabled graphical.target)
  vncservicestatus=$(sudo service vncserver-x11-serviced status | grep -q 'running')
  xservicestatus=$(sudo service lightdm status | grep -q 'running')
  ipaddress=$(hostname -I)
  
  # Get the status of each VNC related service for status-service
  if [ "$bootoptionstatus" = "static" ]; then
    isgraphical="Console"
    elif [ "$bootoptionstatus" = "indirect" ]; then
    isgraphical="Desktop"
  fi
    
  if [ "$vncservicestatus" = "true" ]; then
    isenabled-vnc="running"
    elif [ "$vncservicestatus" = "false" ]; then
    isenabled-vnc="not running"
  fi
      
  if [ "$xservicestatus" = "true" ]; then
    isenabled-x="running"
    elif [ "$xservicestatus" = "false" ]; then
    isenabled-x="not running"
  fi
  
  # Checks whether we have the required package to run a VNC server
  # Should be there on a stock treehouses install
  if [ ! -d /usr/share/doc/realvnc-vnc-server ] ; then
    echo "Error: the vnc server is not installed, to install it run:"
    echo "apt-get install realvnc-vnc-server"
    exit 1;
  fi

# Starts the VNC server service, modifies the config.txt to output screen data even if a screen is missing
# and sets the system to run the desktop graphical interface on boot
  if [ "$status" = "on" ]; then
    enable_service vncserver-x11-serviced.service
    start_service vncserver-x11-serviced.service
    sudo sed -i '$ a hdmi_group=2' /boot/config.txt
    sudo sed -i '$ a hdmi_mode=82' /boot/config.txt
    sudo sed -i 's/#hdmi_force_hotplug=1/hdmi_force_hotplug=1/' /boot/config.txt
    sudo systemctl set-default graphical.target
    reboot_needed
    echo "Success: the vnc service has been started and enabled when the system boots"
    echo "You can then remotely access the system with a VNC client using the IP address(es): $ipaddress" 

# Stops the VNC server service, modifies the config.txt to no longer output screen data  if a screen is missing
# and sets the system to run the console interface on boot 
  elif [ "$status" = "off" ]; then
    disable_service vncserver-x11-serviced.service
    stop_service vncserver-x11-serviced.service    
    sudo sed -i '/hdmi_group=2/d' /boot/config.txt
    sudo sed -i '/hdmi_mode=82/d' /boot/config.txt
    sudo sed -i 's/hdmi_force_hotplug=1/#hdmi_force_hotplug=1/' /boot/config.txt
    sudo systemctl set-default multi-user.target
    reboot_needed
    echo "Success: the vnc service has been stopped and disabled when the system boots."
 
# Prints the status of the VNC server, along with advice to enable it or disable it accordingly
  elif [ "$status" = "status" ]; then
    if [ "$bootoptionstatus" = "static" ] && [ "$vncservicestatus" = false ] && [ "$xservicestatus" = false ]; then
      echo "VNC is disabled." 
      echo "To enable it, use $(basename "$0") vnc on"
    elif [ "$bootoptionstatus" = "indirect" ] && [ "$vncservicestatus" = true ] && [ "$xservicestatus" = true ]; then
      echo "VNC is enabled."
      echo "You can now remotely access the system with a VNC client using the IP address(es): $ipaddress" 
      echo "To disable it, use $(basename "$0") vnc off"
    else
      echo "VNC server is not configured correctly. Please try $(basename "$0") vnc on to enable it, or $(basename "$0") vnc off to disable it."
      echo "Alternatively, you may try $(basename "$0") vnc status-service to verify the status of each specific required service."
    fi
    
 # Prints the status of the specific VNC related services, along with advice to enable it or disable it accordingly
  elif [ "$status" = "status-service" ]; then
      echo "The system boots into $isgraphical"
      echo "The VNC service is $isenabled-vnc"
      echo "The X window service is $isenabled-x"
      echo "In order to access your desktop remotely, the system needs to boot into Desktop and VNC and X window services need to be running"
      if [ "$bootoptionstatus" = "static" ] || [ "$vncservicestatus" = false ] || [ "$xservicestatus" = false ]; then
      echo "Your system is not configured correctly."
      echo "You may try $(basename "$0") vnc on, or attempt to enable any missing service manually"
    fi
    
  else
    echo "Error: only 'on', 'off', 'status' and 'status-service' options are supported";
  fi
}

# Prints the options for the "vnc" command
function vnc_help {
  echo ""
  echo "Usage: $(basename "$0") vnc <on|off>"
  echo ""
  echo "Enables or disables the VNC server service"
  echo ""
  echo "Example:"
  echo "  $(basename "$0") vnc status"
  echo "      Prints the status of the VNC server (enabled or disabled)."
  echo ""
  echo "Example:"
  echo "  $(basename "$0") vnc status-full"
  echo "      Prints the configuration of each required component (boot option, vnc service, x service)."
  echo ""
  echo "  $(basename "$0") vnc on"
  echo "      The VNC service will be enabled. This will allow devices on your network to be able to connect to the raspberry pi using VNC viewer."
  echo ""
  echo "  $(basename "$0") vnc off"
  echo "      The VNC service will be disabled."
} 
