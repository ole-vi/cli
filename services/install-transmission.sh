#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/transmission/downloads
  mkdir /srv/transmission/watch

  # create yml(s)
  cat << EOF > /srv/transmission/transmission.yml
version: "2.1"
services:
  transmission:
    image: linuxserver/transmission
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - /srv/transmission:/root/.transmission
      - /srv/transmission/downloads:/downloads
      - /srv/transmission/watch:/watch
    ports:
      - 9091:9091
      - 51413:51413
      - 51413:51413/udp
    restart: unless-stopped
EOF


  # add autorun
  cat << EOF > /srv/transmission/autorun
transmission_autorun=true

if [ "$transmission_autorun" = true ]; then
  treehouses services transmission up
fi


EOF
}

# environment var
function uses_env {
  echo false
}

# add supported arm(s)
function supported_arms {
  echo "v7l"
}

# add port(s)
function get_ports {
  echo "9091"
}

# add size (in MB)
function get_size {
  echo "77"
}

# add info
function get_info {
  echo "https://github.com/linuxserver/docker-transmission"
  echo
  echo "Transmission is a BitTorrent client with features including encryption, a web interface, peer exchange, magnet links, DHT, µTP, UPnP and NAT-PMP port forwarding, webseed support, watch directories, tracker editing, global and per-torrent speed limits, and more."
}

# add svg icon
function get_icon {
  cat <<EOF
<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" width="48px" height="48px" id="svg5186" sodipodi:version="0.32" inkscape:version="0.45+devel" sodipodi:docname="transmission.svg" inkscape:output_extension="org.inkscape.output.svg.inkscape" inkscape:export-filename="/home/andreas/project/application icons/48x48/transmission.png" inkscape:export-xdpi="90" inkscape:export-ydpi="90"><script xmlns="" id="youtube-hd-{4cf120ba-c67a-47a9-9c99-7ab813d08379}">var ythdlog = () =&gt; {};;var ythderror = () =&gt; {};</script>
  <defs id="defs5188">
    <linearGradient inkscape:collect="always" id="linearGradient9795">
      <stop style="stop-color:#ffffff;stop-opacity:1;" offset="0" id="stop9797"/>
      <stop style="stop-color:#ffffff;stop-opacity:0;" offset="1" id="stop9799"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient9783">
      <stop style="stop-color:#000000;stop-opacity:1;" offset="0" id="stop9785"/>
      <stop style="stop-color:#000000;stop-opacity:0;" offset="1" id="stop9787"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient9775">
      <stop style="stop-color:#f9f9f9;stop-opacity:1" offset="0" id="stop9777"/>
      <stop style="stop-color:#eeeeec;stop-opacity:0.62037037" offset="1" id="stop9779"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5948">
      <stop style="stop-color:#787b76;stop-opacity:1;" offset="0" id="stop5950"/>
      <stop id="stop5956" offset="0.87125719" style="stop-color:#babcb9;stop-opacity:1"/>
      <stop style="stop-color:#787b76;stop-opacity:1" offset="1" id="stop5952"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5908">
      <stop style="stop-color:#ffffff;stop-opacity:1;" offset="0" id="stop5910"/>
      <stop style="stop-color:#ffffff;stop-opacity:0;" offset="1" id="stop5912"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5898">
      <stop style="stop-color:#cc0000;stop-opacity:1;" offset="0" id="stop5900"/>
      <stop id="stop5906" offset="0.36509839" style="stop-color:#ef0000;stop-opacity:1"/>
      <stop style="stop-color:#aa0000;stop-opacity:1" offset="1" id="stop5902"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5871">
      <stop style="stop-color:#f0f2ef;stop-opacity:1" offset="0" id="stop5873"/>
      <stop style="stop-color:#cdd1c8;stop-opacity:1" offset="1" id="stop5875"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5843">
      <stop style="stop-color:#888a85;stop-opacity:1" offset="0" id="stop5845"/>
      <stop style="stop-color:#2e3436;stop-opacity:1" offset="1" id="stop5847"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5835">
      <stop style="stop-color:#555753;stop-opacity:1;" offset="0" id="stop5837"/>
      <stop style="stop-color:#2e3436;stop-opacity:1" offset="1" id="stop5839"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5823">
      <stop style="stop-color:#2e3436;stop-opacity:1;" offset="0" id="stop5825"/>
      <stop style="stop-color:#2e3436;stop-opacity:0;" offset="1" id="stop5827"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" id="linearGradient5234">
      <stop style="stop-color:#babdb6;stop-opacity:1;" offset="0" id="stop5236"/>
      <stop id="stop5242" offset="0.13299191" style="stop-color:#eeeeec;stop-opacity:1"/>
      <stop style="stop-color:#babdb6;stop-opacity:1" offset="1" id="stop5238"/>
    </linearGradient>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5234" id="linearGradient5240" x1="23.738585" y1="4.156569" x2="23.738585" y2="19.46567" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5823" id="linearGradient5829" x1="23.732271" y1="30.057167" x2="23.688078" y2="22.632544" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5835" id="linearGradient5841" x1="23.9375" y1="30.616879" x2="23.9375" y2="36.357994" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5843" id="linearGradient5849" x1="20.771132" y1="32.248005" x2="20.563131" y2="23.939499" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5898" id="linearGradient5904" x1="14.8125" y1="5.6244211" x2="14.8125" y2="9" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5908" id="linearGradient5914" x1="24.040522" y1="5.0690055" x2="24.040522" y2="10.0086" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5871" id="linearGradient5928" x1="13.625" y1="33.125" x2="14.125" y2="24" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient5948" id="linearGradient5954" x1="10.1875" y1="20.25" x2="10.1875" y2="42.5" gradientUnits="userSpaceOnUse"/>
    <filter inkscape:collect="always" id="filter9771" x="-0.02976581" width="1.0595316" y="-0.13995509" height="1.2799102">
      <feGaussianBlur inkscape:collect="always" stdDeviation="0.5196773" id="feGaussianBlur9773"/>
    </filter>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient9775" id="linearGradient9781" x1="24.71875" y1="35.958694" x2="23.936657" y2="17.070877" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient9783" id="linearGradient9789" x1="18.3125" y1="20.743757" x2="18.3125" y2="21.814325" gradientUnits="userSpaceOnUse"/>
    <linearGradient inkscape:collect="always" xlink:href="#linearGradient9795" id="linearGradient9801" x1="30.4375" y1="31.82852" x2="29.742416" y2="27.45352" gradientUnits="userSpaceOnUse"/>
  </defs>
  <sodipodi:namedview id="base" pagecolor="#ffffff" bordercolor="#666666" borderopacity="1.0" inkscape:pageopacity="0.0" inkscape:pageshadow="2" inkscape:zoom="5.6568542" inkscape:cx="30.372474" inkscape:cy="21.423534" inkscape:current-layer="layer1" showgrid="true" inkscape:grid-bbox="true" inkscape:document-units="px" inkscape:window-width="1091" inkscape:window-height="777" inkscape:window-x="557" inkscape:window-y="164">
    <inkscape:grid type="xygrid" id="grid5195"/>
  </sodipodi:namedview>
  <metadata id="metadata5191">
    <rdf:RDF>
      <cc:Work rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g id="layer1" inkscape:label="Layer 1" inkscape:groupmode="layer">
    <rect style="opacity:0.28240741;fill:#2e3436;fill-opacity:1;stroke:none;stroke-width:1;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;filter:url(#filter9771)" id="rect9761" width="41.901279" height="8.9116125" x="3" y="39" rx="2.2980971" ry="2.2980971"/>
    <path style="fill:url(#linearGradient5954);fill-rule:evenodd;stroke:#555753;stroke-width:1.00000011999999994px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;fill-opacity:1" d="M 10,16.59375 C 8.8196081,16.548814 7.6402135,17.571722 7.53125,18.8125 C 6.643292,26.100083 5.3269606,33.403527 4.65625,40.6875 L 4.65625,43.75 C 4.6900093,45.329492 5.7271791,46.392039 6.875,46.59375 L 41.5,46.59375 C 42.479024,46.569246 43.565009,45.89005 43.53125,44.59375 L 43.53125,40.65625 L 40.40625,19.4375 C 40.152431,18.135677 39.039534,16.752716 37.5,16.59375 L 10,16.59375 z" id="path5232" sodipodi:nodetypes="ccccccccccc"/>
    <path style="fill:url(#linearGradient5928);fill-opacity:1;fill-rule:evenodd;stroke:#555753;stroke-width:0.99999994000000003px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" d="M 10.601853,39.624614 C 9.47224,39.502143 8.6733861,38.760954 8.7014295,37.401046 L 10.601853,21.407733 C 10.893931,20.339398 11.586949,19.485349 12.680909,19.488442 L 34.605501,19.488442 C 35.691818,19.455762 36.778134,20.208796 37.062569,21.104687 L 39.478435,37.237611 C 39.535481,38.706714 38.931012,39.557098 37.913093,39.523599 L 10.601853,39.624614 z" id="path5230" sodipodi:nodetypes="ccccccccc"/>
    <path style="fill:url(#linearGradient5841);fill-rule:evenodd;stroke:url(#linearGradient5849);stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;fill-opacity:1" d="M 20.46875,20.4375 L 18.40625,32.46875 L 15.4375,32.46875 L 23.46875,37.625 L 32.4375,32.46875 L 29.46875,32.46875 L 27.59375,20.4375 L 20.46875,20.4375 z" id="path5197" sodipodi:nodetypes="cccccccc"/>
    <rect style="opacity:1;fill:url(#linearGradient5904);fill-opacity:1;stroke:#930000;stroke-width:1.00000011999999994;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" id="rect5224" width="31.113209" height="6.0609155" x="8.4847708" y="4.5135489" rx="5.0159144" ry="1.9854566"/>
    <rect style="opacity:0.58333333;fill:none;fill-opacity:1;stroke:url(#linearGradient5914);stroke-width:1.00000011999999994;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" id="rect5896" width="29.080278" height="3.9395947" x="9.5003824" y="5.5690055" rx="1.8339339" ry="1.2783499"/>
    <path style="opacity:0.24537036000000001;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:url(#linearGradient9781);stroke-width:1.00000011999999994px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" d="M 10.592965,17.57221 C 9.474152,17.53019 8.3562869,18.486727 8.2530054,19.647002 L 5.4687498,39.722803 C 5.4796612,39.847886 5.4997885,39.979699 5.5279893,40.102694 L 5.5279893,42.966491 C 5.559989,44.443503 6.5430497,45.407885 7.6309909,45.596509 L 40.479283,45.596509 C 41.407232,45.573597 42.406944,44.967688 42.374947,43.755497 L 42.374947,40.073472 C 42.382229,40.044972 42.398547,40.013922 42.404566,39.985805 L 42.374947,39.781247 L 42.374947,39.576691 L 42.345327,39.576691 L 39.442592,20.202228 C 39.202015,18.98487 38.147175,17.72086 36.687956,17.57221 L 10.592965,17.57221 z" id="path5881"/>
    <path style="fill:url(#linearGradient9789);fill-rule:evenodd;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;fill-opacity:1;opacity:0.20833333000000001" d="M 10.210155,29.955767 L 12.048004,22 L 36.07815,22.05802 L 37.857941,31.044156 L 36.681164,21.969631 C 36.460193,20.967897 35.929863,20 34.957591,20.025088 L 13.037281,19.980893 C 11.606886,19.936699 11.32554,20.864777 11,21.969631 L 10.210155,29.955767 z" id="path5926" sodipodi:nodetypes="ccccccccc"/>
    <rect style="opacity:1;fill:url(#linearGradient5240);fill-opacity:1;stroke:#888a85;stroke-width:1;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" id="rect5226" width="7.0964494" height="25.970053" x="20.48369" y="3.6044116" rx="1.0763195" ry="1.0763192"/>
    <rect style="opacity:1;fill:url(#linearGradient5829);fill-opacity:1;stroke:none;stroke-width:1;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" id="rect5244" width="8.1317272" height="8.0433397" x="19.975765" y="22.013826" rx="1.0763195" ry="1.0763192"/>
    <path style="opacity:0.43518521;fill:none;fill-rule:evenodd;stroke:#ffffff;stroke-width:1px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1" d="M 11.423372,41.486321 L 39.533811,41.486321" id="path5879" sodipodi:nodetypes="cc"/>
    <rect style="opacity:0.22685185;fill:none;fill-opacity:1;stroke:#ffffff;stroke-width:1;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" id="rect5892" width="5.151906" height="23.93712" x="21.428234" y="4.6321397" rx="1.0763195" ry="1.0763192"/>
    <g id="g5972" style="opacity:0.62037037">
      <path sodipodi:nodetypes="cc" id="path5831" d="M 20.4375,30.5 L 27.5,30.5" style="fill:none;fill-rule:evenodd;stroke:#888a85;stroke-width:1px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1;opacity:1"/>
      <path sodipodi:nodetypes="cc" id="path5833" d="M 19.960998,32.5 L 27.976504,32.5" style="fill:none;fill-rule:evenodd;stroke:#888a85;stroke-width:1px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1;opacity:0.68055556"/>
      <path sodipodi:nodetypes="cc" id="path5958" d="M 20.273498,31.5 L 27.726504,31.5" style="fill:none;fill-rule:evenodd;stroke:#5d5d5c;stroke-width:1px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1;opacity:1"/>
      <path sodipodi:nodetypes="cc" id="path5960" d="M 19.869986,33.488738 L 28.141277,33.488738" style="fill:none;fill-rule:evenodd;stroke:#5d5d5c;stroke-width:0.99999994000000003px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1;opacity:0.68055556"/>
    </g>
    <path style="fill:none;fill-rule:evenodd;stroke:#ffffff;stroke-width:1px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1" d="M 14.381412,31.513733 L 17.519198,31.513733" id="path9791" sodipodi:nodetypes="cc"/>
    <path style="fill:none;fill-rule:evenodd;stroke:#ffffff;stroke-width:1px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1" d="M 30.443912,31.451233 L 33.581698,31.451233" id="path9803" sodipodi:nodetypes="cc"/>
    <path sodipodi:type="arc" style="opacity:0.33500001;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" id="path5119" sodipodi:cx="9.8553009" sodipodi:cy="42.188465" sodipodi:rx="1.1932427" sodipodi:ry="1.0827572" d="M 11.048544,42.188465 A 1.1932427,1.0827572 0 1 1 8.6620582,42.188465 A 1.1932427,1.0827572 0 1 1 11.048544,42.188465 z" transform="matrix(0.4216252,0,0,0.4766032,5.3634688,21.39228)"/>
  </g>
</svg>
EOF
}
