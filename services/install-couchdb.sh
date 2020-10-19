#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/couchdb

  # create yml(s)
  cat << EOF > /srv/couchdb/couchdb.yml
version: "2"
services:
  couchdb:
    image: treehouses/couchdb:2.3.1
    ports:
      - "5984:5984"
    volumes:
      - "/srv/couchdb/data:/opt/couchdb/data"
      - "/srv/couchdb/log:/opt/couchdb/var/log"
EOF

  # add autorun
  cat << EOF > /srv/couchdb/autorun
couchdb_autorun=true

if [ "$couchdb_autorun" = true ]; then
  treehouses services couchdb up
fi


EOF
}

# environment var
function uses_env {
  echo false
}

# add supported arm(s)
function supported_arms {
  echo "armv7l"
  echo "armv6l"
  echo "x86_64"
}

# add port(s)
function get_ports {
  echo "5984"
}

# add size (in MB)
function get_size {
  echo "350"
}

# add description
function get_description {
  echo "CouchDB is an open-source document-oriented NoSQL database, implemented in Erlang"
}

# add info
function get_info {
  echo "https://github.com/treehouses/rpi-couchdb"
  echo "https://github.com/docker-library/docs/tree/master/couchdb"
  echo
  echo "\"Apache CouchDB lets you access your data where you need it by defining the"
  echo "Couch Replication Protocol that is implemented by a variety of projects and products"
  echo "that span every imaginable computing environment from globally distributed server-clusters,"
  echo "over mobile phones to web browsers.\""
}

# add svg icon
function get_icon {
  cat <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="289.59799" height="293.20099" viewBox="0 0 289.598 293.201" id="Layer_1" xml:space="preserve">
  <metadata id="metadata41">
    <rdf:RDF>
      <cc:Work rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <defs id="defs39">
    <defs id="defs5">
      <rect width="841.89001" height="595.28003" x="-275.78601" y="-151.084" id="SVGID_1_" />
    </defs>
    <clipPath id="SVGID_2_">
      <use id="use9" style="overflow:visible" x="0" y="0" width="289.59799" height="293.20099" xlink:href="#SVGID_1_" />
    </clipPath>
  </defs>
  <path d="m 59.298,218.992 c -11.214,0 -16.476,7.621 -16.476,19.343 0,11.322 5.262,19.161 16.476,19.161 11.177,0 16.44,-7.839 16.44,-19.161 0,-11.722 -5.263,-19.343 -16.44,-19.343 m 0,33.423 c -7.258,0 -9.69,-5.808 -9.69,-14.153 0,-9.036 2.432,-14.117 9.69,-14.117 7.149,0 9.689,5.081 9.689,14.117 0,8.345 -2.431,14.153 -9.689,14.153" clip-path="url(#SVGID_2_)" id="path11" style="fill:#444444" />
  <path d="m 115.802,219.428 h -6.714 v 29.54 c -0.834,0.652 -1.815,1.231 -2.903,1.742 -1.852,0.867 -4.427,1.704 -7.476,1.704 -5.371,0 -7.04,-3.302 -7.04,-11.721 v -21.266 h -6.678 v 21.52 c 0,11.359 3.738,16.548 12.158,16.548 4.101,0 7.288,-1.209 9.508,-2.468 1.3,-0.737 2.431,-1.56 3.375,-2.467 l 0.907,4.681 4.863,-0.398 v -37.415 z" clip-path="url(#SVGID_2_)" id="path13" style="fill:#444444" />
  <path d="m 125.347,238.479 c 0,14.225 8.056,19.121 16.04,19.016 3.085,-0.041 5.729,-0.453 7.585,-0.979 1.084,-0.308 2.069,-0.617 2.94,-1.017 l 0.579,-4.827 c -0.942,0.327 -1.96,0.614 -3.084,0.871 -1.888,0.434 -4.464,0.828 -7.222,0.871 -6.497,0.103 -9.962,-4.282 -9.98,-14.044 -0.019,-10.125 3.484,-14.263 9.98,-14.263 2.758,0 5.297,0.476 7.186,0.908 1.124,0.258 2.141,0.58 3.085,0.906 l -0.544,-4.898 c -0.871,-0.399 -1.857,-0.706 -2.977,-1.018 -1.893,-0.523 -4.537,-1.015 -7.73,-1.015 -7.838,0 -15.858,4.499 -15.858,19.489" clip-path="url(#SVGID_2_)" id="path15" style="fill:#444444" />
  <path d="m 161.165,257.496 h 6.714 v -28.852 c 1.742,-0.58 6.314,-3.883 10.814,-3.883 4.354,0 6.714,2.468 6.714,12.339 v 20.396 h 6.714 v -20.904 c 0,-12.192 -3.266,-16.947 -11.722,-16.947 -4.899,0 -8.565,1.198 -12.521,4.282 V 205.346 L 161.165,206 v 51.496 z" clip-path="url(#SVGID_2_)" id="path17" style="fill:#444444" />
  <path d="m 235.814,209.593 c -4.559,-3.502 -10.415,-4.247 -16.585,-4.247 h -14.951 v 52.15 h 16.584 c 18.146,0 22.465,-10.742 22.465,-27.146 0,-11.358 -3,-17.291 -7.513,-20.757 m -17.237,42.677 h -7.331 v -41.661 h 9.87 c 12.013,0 15.404,6.532 15.388,20.032 -0.021,16.73 -3.774,21.629 -17.927,21.629" clip-path="url(#SVGID_2_)" id="path19" style="fill:#444444" />
  <path d="m 283.719,231.185 c -1.709,-0.974 -3.665,-1.523 -5.879,-1.704 2.758,-0.291 9.29,-2.795 9.29,-10.452 0,-9.871 -4.899,-13.683 -18.399,-13.683 h -14.335 v 52.15 h 17.093 c 12.085,0 18.109,-4.646 18.109,-15.062 0,-6.494 -2.944,-9.574 -5.879,-11.249 m -22.754,-20.576 h 6.858 c 9.11,0 12.793,1.523 12.774,8.129 -0.017,5.696 -2.867,8.818 -11.178,8.818 h -8.455 v -16.947 z m 8.782,41.661 h -8.782 v -20.104 h 8.673 c 9.291,0 13.5,2.178 13.5,10.198 0,8.382 -4.536,9.906 -13.391,9.906" clip-path="url(#SVGID_2_)" id="path21" style="fill:#444444" />
  <path d="m 20.794,257.496 c 4.246,0 7.84,-0.577 10.415,-1.198 1.489,-0.358 2.831,-0.762 4.029,-1.234 l 0.617,-5.66 c -1.271,0.472 -2.655,0.887 -4.138,1.306 -2.619,0.742 -6.096,1.286 -10.125,1.307 -9.653,0.052 -14.353,-6.206 -14.407,-21.846 -0.055,-16.114 5.733,-21.152 15.097,-21.231 3.738,-0.03 7.119,0.557 9.581,1.125 1.457,0.339 2.794,0.764 3.992,1.198 l -0.581,-5.625 c -1.161,-0.398 -2.467,-0.729 -3.92,-1.052 -2.466,-0.549 -5.915,-1.089 -9.834,-1.089 -12.375,0 -21.544,6.604 -21.52,26.746 0.012,10.415 2.322,17.383 6.06,21.593 3.738,4.208 8.891,5.66 14.734,5.66" clip-path="url(#SVGID_2_)" id="path23" style="fill:#444444" />
  <path d="m 213.361,270.927 c -2.085,0 -4.108,0.949 -5.698,2.601 l -0.722,-2.601 -2.663,0.207 v 21.324 h 3.819 v -16.494 c 0.475,-0.352 0.991,-0.68 1.548,-0.95 0.972,-0.472 2.312,-0.97 3.881,-0.97 0.661,0 1.053,0.083 1.28,0.145 l 0.289,0.145 0.454,-2.952 c -0.206,-0.082 -0.434,-0.165 -0.682,-0.228 -0.412,-0.103 -0.949,-0.227 -1.506,-0.227" clip-path="url(#SVGID_2_)" id="path25" style="fill:#777777" />
  <path d="m 235.471,278.275 c -0.09,-3.777 -2.663,-7.38 -7.865,-7.349 -5.244,0.031 -9.228,3.324 -9.228,11.188 0,7.122 3.364,10.715 10.032,10.715 1.672,0 3.098,-0.246 4.149,-0.496 0.599,-0.143 1.156,-0.31 1.652,-0.495 l 0.392,-2.767 c -0.557,0.165 -1.157,0.305 -1.796,0.434 -1.095,0.222 -2.561,0.415 -4.129,0.433 -3.819,0.044 -6.358,-1.774 -6.358,-6.977 v -0.743 h 12.82 c 0.082,-0.269 0.135,-0.93 0.206,-1.652 0.074,-0.744 0.138,-1.712 0.125,-2.291 m -3.304,1.116 c -0.015,0.125 -0.021,0.289 -0.021,0.516 h -9.764 c 0.165,-2.478 0.846,-3.922 1.816,-4.851 0.97,-0.929 2.188,-1.301 3.488,-1.301 2.54,0 4.403,1.485 4.501,4.996 0.006,0.186 0.007,0.413 -0.02,0.64" clip-path="url(#SVGID_2_)" id="path27" style="fill:#777777" />
  <polygon points="240.734,263.536 240.734,292.829 244.532,292.829 244.532,263.164 " clip-path="url(#SVGID_2_)" id="polygon29" style="fill:#777777" />
  <path d="m 266.952,290.229 c -0.352,-0.146 -0.455,-0.661 -0.455,-1.651 v -8.361 c 0,-6.688 -1.589,-9.125 -8.278,-9.125 -2.063,0 -3.692,0.336 -4.851,0.661 -0.68,0.191 -1.28,0.413 -1.796,0.641 l -0.413,2.87 c 0.661,-0.248 1.362,-0.457 2.127,-0.641 1.3,-0.313 2.931,-0.619 4.644,-0.619 3.53,0 4.77,0.681 4.77,5.078 v 2.332 l -1.135,-0.165 c -0.719,-0.104 -1.652,-0.144 -2.622,-0.144 -4.789,0 -9.455,1.114 -9.455,6.048 0,3.737 2.539,6.084 6.296,6.049 2.746,-0.027 4.519,-0.664 5.657,-1.384 0.657,-0.416 1.176,-0.887 1.548,-1.403 0,0.33 0.227,1.218 0.723,1.775 0.495,0.557 1.259,1.012 2.395,1.012 0.66,0 1.241,-0.071 1.651,-0.186 l 0.66,-0.187 0.27,-2.519 c -0.58,10e-4 -1.344,0.082 -1.736,-0.081 m -4.253,-1.611 c -0.476,0.351 -1.015,0.633 -1.61,0.908 -1.015,0.468 -2.457,0.888 -4.19,0.888 -2.498,0 -3.923,-0.991 -3.923,-3.117 0,-3.612 4.15,-3.89 6.586,-3.818 l 2.126,0.062 1.012,0.062 v 5.015 z" clip-path="url(#SVGID_2_)" id="path31" style="fill:#777777" />
  <polygon points="285.324,292.829 289.598,292.829 282.496,282.239 289.598,271.546 285.552,271.546 280.391,280.093 275.188,271.546 271.184,271.546 278.243,282.239 271.184,292.829 275.415,292.829 280.391,284.53 " clip-path="url(#SVGID_2_)" id="polygon33" style="fill:#777777" />
  <path d="m 235.298,126.699 c 0,12.001 -6.323,17.882 -18.1,18.09 v 0.01 H 72.399 v -0.01 c -11.777,-0.208 -18.1,-6.089 -18.1,-18.09 0,-12.001 6.323,-17.882 18.1,-18.09 v -0.01 h 144.799 v 0.01 c 11.777,0.208 18.1,6.089 18.1,18.09 m -18.1,27.159 v -0.01 H 72.399 v 0.01 c -11.777,0.208 -18.1,6.09 -18.1,18.091 0,12.001 6.323,17.882 18.1,18.09 v 0.01 h 144.799 v -0.01 c 11.776,-0.208 18.1,-6.089 18.1,-18.09 0,-12.001 -6.323,-17.883 -18.1,-18.091 m 45.25,-99.538 v -0.01 c -11.777,0.208 -18.101,6.089 -18.101,18.09 v 99.549 c 0,12.001 6.323,17.882 18.101,18.09 v -0.021 c 17.665,-0.623 27.149,-18.266 27.149,-54.27 V 90.5 C 289.598,66.498 280.113,54.736 262.448,54.32 M 27.15,54.31 v 0.01 C 9.484,54.736 0,66.497 0,90.5 v 45.249 c 0,36.004 9.484,53.646 27.15,54.27 v 0.021 c 11.777,-0.208 18.099,-6.089 18.099,-18.09 V 72.4 c 0,-12.001 -6.322,-17.882 -18.099,-18.09 m 235.298,-9.06 c 0,-30.003 -15.808,-44.705 -45.25,-45.225 V 0 H 72.399 V 0.025 C 42.957,0.545 27.15,15.247 27.15,45.25 v 0.015 c 17.665,0.312 27.149,9.133 27.149,27.135 0,18.001 9.485,26.823 27.15,27.135 v 0.015 h 126.699 v -0.015 c 17.666,-0.312 27.15,-9.134 27.15,-27.135 0,-18.002 9.484,-26.823 27.15,-27.135 V 45.25 z" clip-path="url(#SVGID_2_)" id="path35" style="fill:#e42528" />
</svg>
EOF
}
