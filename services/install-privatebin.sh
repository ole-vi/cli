#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/privatebin

  # create yml(s)
  {
    echo "version: \"3\""
    echo
    echo "services:"
    echo "  privatebin:"
    echo "    container_name: privatebin"
    echo "    image: treehouses/privatebin"
    echo "    ports:"
    echo "      - \"8083:80\""
  } > /srv/privatebin/privatebin.yml

  # add autorun
  {
    echo "privatebin_autorun=true"
    echo
    echo "if [ \"\$privatebin_autorun\" = true ]; then"
    echo "  docker-compose -f /srv/privatebin/privatebin.yml -p privatebin up -d"
    echo "fi"
    echo
    echo
  } > /srv/privatebin/autorun
}

# add port(s)
function get_ports {
  echo "8083"
}

# add size (in MB)
function get_size {
  echo "550"
}

# add info
function get_info {
  echo "https://github.com/treehouses/privatebin"
  echo
  echo "\"A minimalist, open source online pastebin where the server has"
  echo "zero knowledge of pasted data. Data is encrypted/decrypted in the"
  echo "browser using 256 bits AES. https://privatebin.info/\""
}

# add svg icon
function get_icon {
  cat <<EOF
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2500 500" height="500" width="2500">
  <defs>
    <linearGradient id="a">
      <stop offset="0" stop-color="#ffab00" />
      <stop offset=".206" stop-color="orange" />
      <stop offset=".247" stop-color="#ffab00" />
      <stop offset="1" stop-color="#f80" />
    </linearGradient>
    <radialGradient spreadMethod="pad" r="60%" fy="50%" fx="50%" id="b" xlink:href="#a" />
    <filter id="c" color-interpolation-filters="sRGB">
      <feGaussianBlur stdDeviation="3" result="result1" />
      <feBlend in="result1" mode="multiply" result="result5" in2="result1" />
      <feGaussianBlur stdDeviation="1" result="result6" in="result5" />
      <feComposite operator="xor" in="result6" in2="result5" result="result8" />
      <feComposite in2="result8" operator="xor" result="fbSourceGraphic" in="result6" />
      <feSpecularLighting specularExponent="55" specularConstant="2.2" surfaceScale="2" lighting-color="#fff" result="result1" in="fbSourceGraphic">
        <fePointLight z="20000" y="-10000" x="-5000" />
      </feSpecularLighting>
      <feComposite operator="in" result="result2" in="result1" in2="fbSourceGraphic" />
      <feComposite in2="result2" k3="1" k2="2" operator="arithmetic" result="result4" in="fbSourceGraphic" />
      <feComposite result="result91" operator="in" in="result4" in2="result4" />
      <feBlend in2="result91" mode="darken" />
    </filter>
  </defs>
  <g stroke="#000">
    <path transform="matrix(.95665 0 0 .95665 10.837 10.837)" d="M250.418 3.158L23.301 126.238l-.42 246.84 226.701 123.764 227.117-123.08.42-246.84zm-.711 97.865v.006c3.78 0 7.604.297 11.457.875 41.101 6.166 72.183 40.64 66.384 70.457-5.798 29.816-33.28 55.978-40.085 61.672-6.805 5.695 37.096 164.944 37.096 164.944h-149.12s46.181-156.802 36.486-164.944c-9.695-8.142-41.197-36.872-36.388-68.935 4.81-32.064 37.627-63.975 74.17-64.074z" fill="url(#b)" stroke-width="15.68" stroke-linecap="round" stroke-linejoin="round" filter="url(#c)" />
    <text y="949.388" x="1510.89" style="line-height:125%" font-weight="400" font-size="28.614" font-family="sans-serif" letter-spacing="0" word-spacing="0" fill="#ff920f" stroke-width="7" filter="url(#c)" transform="translate(0 -552.362)">
      <tspan rotate="0 0 0 0 0 0 0 0 0 0 0" dx="0" style="-inkscape-font-specification:Arial;text-align:center" y="949.388" x="1510.89" font-size="412.044" font-family="Arial" letter-spacing="-2.15" text-anchor="middle">
        <tspan letter-spacing="0">
          <tspan letter-spacing="-10">P</tspan>
          <tspan letter-spacing="10">r</tspan>
          <tspan letter-spacing="7">i</tspan>
          <tspan letter-spacing="-7">v</tspan>
          <tspan letter-spacing="-5">a</tspan>
          <tspan letter-spacing="5">t</tspan>
          <tspan letter-spacing="15">e</tspan>Bin
        </tspan>
      </tspan>
    </text>
  </g>
</svg>
EOF
}
