#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/musicblocks

  # create yml(s)
  {
    echo "version: '3'"
    echo "services:"
    echo "  musicblocks:"
    echo "    image: treehouses/musicblocks"
    echo "    ports:"
    echo "      - 8088:80"
  } > /srv/musicblocks/musicblocks.yml

  # add autorun
  {
    echo "musicblocks_autorun=true"
    echo
    echo "if [ \"\$musicblocks_autorun\" = true ]; then"
    echo "  treehouses services musicblocks up"
    echo "fi"
    echo
    echo
  } > /srv/musicblocks/autorun
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
  echo "aarch64"
}

# add port(s)
function get_ports {
  echo "8088"
}

# add size (in MB)
function get_size {
  echo "217"
}

# add description
function get_description {
  echo "MusicBlocks is a programming language for exploring musical concepts in an fun way"
}

# add info
function get_info {
  echo "https://github.com/treehouses/musicblocks"
  echo
  echo "Music Blocks is a programming language and collection of manipulative tools,"
  echo "which is for exploring musical and mathematical concepts in an integrative and fun way."
}

# add svg icon
function get_icon {
  cat <<EOF
<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" width="320" height="240" viewBox="0 0 84.666668 63.499999" version="1.1" id="svg1917">
  <defs id="defs1911">
    <clipPath id="clipPath1233" clipPathUnits="userSpaceOnUse">
      <path id="path1231" d="M 0,1292.599 H 1774.488 V 0 H 0 Z" />
    </clipPath>
  </defs>
  <g transform="translate(8.3333333e-8,-0.2140398)" id="g999">
    <path id="path410" style="fill:none;stroke:#ffffff;stroke-width:5.30536699;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;stroke-dasharray:none;stroke-opacity:1" d="m 82.013983,51.050751 c 0,5.023131 -4.071783,9.095245 -9.095245,9.095245 h -61.17081 c -5.0234609,0 -9.0952445,-4.072114 -9.0952445,-9.095245 V 12.877329 c 0,-5.023132 4.0717836,-9.0952454 9.0952445,-9.0952454 h 61.17081 c 5.023462,0 9.095245,4.0721134 9.095245,9.0952454 z" />
    <path id="path406" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 82.524737,50.969202 c 0,5.058 -4.100048,9.15838 -9.15838,9.15838 H 36.112595 c -5.058332,0 -9.15838,-4.10038 -9.15838,-9.15838 V 12.530798 c 0,-5.058 4.100048,-9.1583801 9.15838,-9.1583801 h 37.253762 c 5.058332,0 9.15838,4.1003801 9.15838,9.1583801 z" />
    <path id="path414" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="M 36.112629,3.372318 H 73.366391" />
    <path id="path418" style="fill:#719dd4;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 82.524737,50.969202 c 0,5.058 -4.100048,9.15838 -9.15838,9.15838 H 36.112595 c -5.058332,0 -9.15838,-4.10038 -9.15838,-9.15838 V 12.530798 c 0,-5.058 4.100048,-9.1583801 9.15838,-9.1583801 h 37.253762 c 5.058332,0 9.15838,4.1003801 9.15838,9.1583801 z" />
    <path id="path422" style="fill:#64a6f9;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 77.274316,7.2753242 c -0.410504,3.1703488 -2.906098,6.7987338 -6.821004,10.8864828 0.329068,1.259763 0.698023,2.604619 1.116171,4.052183 0.398869,1.366128 0.780454,2.696359 1.151071,3.994347 0.787435,-0.06149 1.634701,-0.05485 2.542794,0.03191 3.654311,0.358317 6.141928,2.83131 7.261423,6.040881 V 12.531099 c 0,-3.6845579 -2.176167,-6.8585633 -5.312612,-8.3121108 0.17517,0.9928531 0.194781,2.0418802 0.06216,3.0563388" />
    <path id="path426" style="fill:#64a6f9;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 79.123243,45.877365 c -0.570052,0.526176 -1.162706,0.984876 -1.771314,1.38308 0.392887,4.971911 -0.553099,8.453046 -2.592985,11.03606 -0.570384,0.721621 -1.176334,1.32757 -1.807876,1.831144 h 0.415489 c 5.057999,0 9.158047,-4.10038 9.158047,-9.15838 V 40.536833 c -0.646834,1.963436 -1.764998,3.823498 -3.401361,5.340532" />
    <path id="path430" style="fill:#64a6f9;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="M 71.401292,3.4164596 C 68.557684,3.2815086 67.815786,6.6758895 69.733352,15.194084 76.091334,8.9291707 75.624989,3.6192183 71.401292,3.4164596" />
    <path id="path434" style="fill:#64a6f9;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 57.218518,56.035279 c 0,-2.839287 2.301477,-5.140432 5.1401,-5.140432 2.838955,0 5.140765,2.301145 5.140765,5.140432 0,0.806714 -0.191458,1.566893 -0.522519,2.246634 0.677414,0.797407 2.108026,1.138773 4.088746,-0.319428 1.898953,-1.40103 3.129798,-4.807709 3.327239,-9.29034 C 68.108657,50.741614 60.928338,47.848811 58.141569,44.537196 54.61955,40.339426 51.596117,27.919622 63.848396,19.863784 64.999468,19.105599 66.04783,18.3524 66.993151,17.600531 66.501876,15.801628 66.057137,13.997076 65.695827,12.142665 64.959913,8.3899657 65.257403,5.4758905 66.1758,3.3721854 H 12.33338 c -5.058332,0 -9.1583799,4.1003801 -9.1583799,9.1587116 v 38.438405 c 0,5.057999 4.1000479,9.15838 9.1583799,9.15838 h 46.924691 c -1.236828,-0.938674 -2.039553,-2.419809 -2.039553,-4.092403" />
    <path id="path438" style="fill:#64a6f9;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 70.950769,30.255469 c -3.753696,2.020939 -3.126474,7.316599 -1.228186,7.90194 2.181485,0.671431 1.512048,2.518862 -0.167526,2.518862 -1.676582,0 -4.697354,-0.673092 -5.36945,-4.867207 -0.504571,-3.152068 1.17035,-7.439917 5.657633,-9.022765 -0.668106,-2.068803 -1.327238,-4.082763 -1.94183,-6.082429 -0.85624,0.821339 -1.759347,1.660627 -2.707993,2.51587 -5.773638,5.209238 -7.721119,12.083757 -3.524345,18.128958 3.13578,4.515206 8.333717,4.714973 12.584005,2.708326 -0.18215,-1.825494 -0.508559,-3.750705 -1.006148,-5.733752 -0.713977,-2.863551 -1.501412,-5.528333 -2.29616,-8.067803" />
    <path id="path442" style="fill:#64a6f9;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 78.116629,41.348698 c 4.177495,-4.180486 0.967259,-12.044201 -4.466676,-11.822829 1.343859,4.882497 2.420142,9.231174 3.081268,13.025422 0.488284,-0.370949 0.954296,-0.778129 1.385408,-1.202593" />
    <path id="path446" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 73.65012,29.525903 c 5.433934,-0.221373 8.644171,7.642342 4.466676,11.822829 -0.431112,0.424464 -0.897457,0.831643 -1.385408,1.202592 C 76.069929,38.756743 74.993979,34.4084 73.65012,29.525903 M 61.669072,41.348732 c -4.196773,-6.045535 -2.249625,-12.919721 3.524346,-18.129291 0.948646,-0.854911 1.851753,-1.694199 2.707992,-2.515871 0.614593,1.999999 1.273725,4.013959 1.941831,6.082763 -4.487284,1.582847 -6.162204,5.870364 -5.657633,9.022431 0.672095,4.194448 3.692868,4.867208 5.36945,4.867208 1.679574,0 2.34901,-1.847099 0.167525,-2.51853 -1.898287,-0.585341 -2.52551,-5.881001 1.228187,-7.90194 0.794747,2.53947 1.582183,5.204252 2.29616,8.067803 0.497589,1.983047 0.823998,3.908258 1.005815,5.733752 -4.249955,2.006647 -9.447892,1.806547 -12.583673,-2.708325 M 71.40116,3.4165595 C 75.624857,3.6193182 76.091535,8.9292706 69.733553,15.193851 67.815654,6.675657 68.557884,3.2816086 71.40116,3.4165595 m 3.357818,54.8798125 c 2.039886,-2.583014 2.985539,-6.064149 2.592985,-11.036059 0.608608,-0.398206 1.201262,-0.856905 1.771314,-1.383081 1.636363,-1.517034 2.754527,-3.376764 3.401361,-5.340533 v -8.255604 c -1.119495,-3.209571 -3.60678,-5.682563 -7.261091,-6.040881 -0.908425,-0.08675 -1.755691,-0.0934 -2.543125,-0.03191 -0.370618,-1.297988 -0.752203,-2.628218 -1.151072,-3.994346 -0.418148,-1.447566 -0.787103,-2.79242 -1.115838,-4.052184 3.914573,-4.087749 6.410167,-7.716133 6.820671,-10.8864827 C 77.40714,6.2608297 77.387196,5.2118025 77.212355,4.2189495 76.109813,3.6146619 74.868664,3.2786143 73.383872,3.3052056 h -7.190623 c -0.918397,2.103705 -1.233505,5.084591 -0.49759,8.8376224 0.36131,1.854079 0.806049,3.658632 1.297656,5.457534 -0.945654,0.751869 -1.993683,1.505401 -3.144755,2.263585 -12.252611,8.055505 -9.229179,20.475309 -5.706827,24.673413 2.786768,3.311615 9.966755,6.204418 16.250947,4.134948 -0.197109,4.482298 -1.428287,7.888978 -3.326906,9.290007 -1.98072,1.458201 -3.411332,1.117168 -4.088747,0.319428 0.331062,-0.679407 0.522187,-1.439919 0.522187,-2.246633 0,-2.838954 -2.30181,-5.1401 -5.140765,-5.1401 -2.838622,0 -5.1401,2.301146 -5.1401,5.1401 0,1.672593 0.78677,3.185307 2.023931,4.12398 h 13.693196 c 0.631544,-0.503573 1.253115,-1.1411 1.823499,-1.862721" />
    <path id="path450" style="fill:#dbe7f4;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 29.965981,35.674013 0.794747,-0.203756 c 5.355823,-1.368455 6.074453,-4.510884 5.654643,-6.64251 l 4.562736,-1.166361 7.203919,28.162525 -5.555257,1.421306 -4.96061,-19.3967 -6.704334,1.715472 z" />
    <path id="path454" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 37.562287,11.279112 c 0,-3.9810521 2.913078,-4.3257419 3.997671,-4.3257419 2.344357,0 4.205748,1.3780947 4.205748,3.8607259 0,2.102375 -1.36214,3.170349 -2.550771,3.980719 -1.620408,1.136778 -2.464018,1.687884 -2.73957,2.257602 h 5.306628 v 2.135948 h -8.356651 c 0.08576,-1.429283 0.188798,-2.928701 2.842611,-4.858233 2.205417,-1.603124 3.084592,-2.223698 3.084592,-3.603123 0,-0.8090402 -0.516869,-1.7400684 -1.688548,-1.7400684 -1.688548,0 -1.740402,1.3957114 -1.758018,2.2921714 z" />
    <path id="path458" style="fill:#f1d01e;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 51.157893,24.227949 0.480305,0.137278 c 0.919395,0.262257 2.628884,0.656805 3.202592,-1.355824 0.162206,-0.568722 0.306132,-2.066478 -1.376766,-2.546784 -2.101046,-0.599965 -2.6701,1.390727 -2.825659,1.937843 L 47.795089,21.58843 c 0.830979,-2.90909 3.065314,-4.519527 6.56473,-3.519693 2.078111,0.593318 4.511881,2.424795 3.574537,5.705498 -0.45039,1.57487 -1.714474,2.278211 -2.70201,2.421804 l -0.01296,0.04421 c 0.502907,0.309124 2.065811,1.630047 1.309954,4.275883 -0.837959,2.933686 -3.596807,4.391887 -6.723613,3.499083 C 48.339544,33.5964 44.496435,32.14252 45.882507,27.28728 l 2.997173,0.856572 -0.02726,0.01529 c -0.23766,0.831975 -0.556091,2.774804 1.499751,3.361474 1.224862,0.349011 2.533154,-0.174838 3.026755,-1.903273 0.60595,-2.120325 -1.424629,-2.796076 -2.846267,-3.200929 z" />
    <path id="path462" style="fill:#c50018;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.33239138" d="m 64.779425,55.966773 c 0,1.372443 -1.113179,2.484626 -2.485956,2.484626 -1.371446,0 -2.484293,-1.112183 -2.484293,-2.484626 0,-1.372444 1.112847,-2.484959 2.484293,-2.484959 1.372777,0 2.485956,1.112515 2.485956,2.484959" />
  </g>
  <g transform="matrix(0.35277777,0,0,-0.35277777,27.446269,43.439827)" id="g1431">
    <path id="path1433" style="fill:#eb6189;fill-opacity:1;fill-rule:nonzero;stroke:none" d="M 0,0 C -2.552,0.887 -3.902,3.692 -3.014,6.243 -2.566,7.521 -3.247,8.92 -4.519,9.361 -5.799,9.809 -7.198,9.134 -7.645,7.856 l -9.813,-28.142 c -1.113,1.203 -2.546,2.168 -4.23,2.756 -5.108,1.781 -10.583,-0.58 -12.217,-5.261 -1.635,-4.676 1.194,-9.937 6.297,-11.713 5.107,-1.778 10.582,0.581 12.214,5.257 l 9.581,27.476 c 1.089,-1.265 2.511,-2.271 4.195,-2.86 2.556,-0.888 3.906,-3.69 3.015,-6.24 -0.443,-1.278 0.233,-2.677 1.51,-3.12 1.276,-0.448 2.676,0.225 3.121,1.503 C 7.808,-7.383 5.103,-1.778 0,0" />
  </g>
  <g transform="matrix(0.35277777,0,0,-0.35277777,27.627843,7.39377)" id="g1819">
    <path id="path1821" style="fill:#f3970e;fill-opacity:1;fill-rule:nonzero;stroke:none" d="M 0,0 C -1.375,-0.406 -2.826,0.383 -3.23,1.76 -3.433,2.447 -4.158,2.842 -4.846,2.639 -5.535,2.436 -5.928,1.713 -5.727,1.023 l 4.473,-15.171 c -0.85,0.175 -1.769,0.15 -2.679,-0.119 -2.75,-0.811 -4.383,-3.524 -3.641,-6.046 0.743,-2.521 3.587,-3.916 6.338,-3.103 2.75,0.812 4.386,3.521 3.644,6.045 l -4.367,14.81 c 0.861,-0.209 1.785,-0.205 2.693,0.064 1.377,0.406 2.826,-0.384 3.232,-1.759 0.202,-0.691 0.927,-1.082 1.616,-0.882 0.688,0.204 1.08,0.929 0.88,1.617 C 5.65,-0.771 2.752,0.809 0,0" />
  </g>
  <g transform="translate(-1.5875)" id="g4891">
    <g id="g1639-6" transform="matrix(0.35277777,0,0,-0.35277777,11.206087,30.05206)">
      <path d="m 0,0 c -2.53,-6.817 -1.55,-11.905 1.993,-19.107 l 3.715,-2.442 c 8.017,-0.389 13.076,0.734 18.328,5.763 13.474,-6.971 17.857,5.351 12.388,11.396 L 38.14,-4.579 C 51.851,7.302 46.681,22.168 36.318,28.865 26.055,35.716 10.139,34.696 4.68,17.396 L 5.537,15.897 C -2.181,18.514 -11.749,9.598 0,0" style="fill:#fdd100;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1641-7" />
    </g>
    <g id="g1643-5" transform="matrix(0.35277777,0,0,-0.35277777,11.423467,29.73131)">
      <path d="M 0,0 C -1.352,1.111 -2.624,2.381 -3.584,3.852 -4.251,4.871 -4.75,6.01 -4.942,7.191 -5.096,8.141 -5.02,9.1 -4.725,9.963 c 0.082,0.234 0.179,0.463 0.283,0.686 0.064,0.14 -0.059,-0.088 0.072,0.134 0.073,0.127 0.143,0.252 0.221,0.371 0.126,0.196 0.259,0.383 0.401,0.565 0.037,0.043 0.264,0.311 0.186,0.225 -0.065,-0.073 0.179,0.187 0.234,0.24 0.364,0.361 0.764,0.685 1.191,0.969 -0.212,-0.141 0.06,0.035 0.13,0.075 0.102,0.057 0.204,0.12 0.307,0.174 0.239,0.129 0.481,0.244 0.727,0.35 0.18,0.076 0.613,0.234 0.622,0.239 -0.109,-0.036 0.24,0.068 0.297,0.085 0.132,0.033 0.264,0.067 0.399,0.096 0.254,0.057 0.51,0.101 0.769,0.135 0.12,0.015 0.242,0.029 0.366,0.039 0.059,0.008 0.123,0.012 0.184,0.017 0.307,0.024 -0.222,-0.002 0.087,0.004 2.256,0.059 4.24,-0.717 5.741,-2.201 2.602,-2.57 3.443,-6.445 3.618,-10.107 0.027,-0.598 0.743,-0.975 1.274,-0.887 0.646,0.11 0.913,0.687 0.886,1.273 C 13.09,6.199 12.177,10.176 9.645,13.078 7.861,15.119 5.309,16.432 2.583,16.551 -2.459,16.771 -7.487,13.03 -7.19,7.678 -6.973,3.754 -4.116,0.557 -1.229,-1.816 -0.142,-2.713 1.084,-0.893 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1645-3" />
    </g>
    <g id="g1647-5" transform="matrix(0.35277777,0,0,-0.35277777,12.258567,36.62633)">
      <path d="m 0,0 c -1.448,2.955 -2.75,6.035 -3.171,9.322 -0.392,3.061 0.17,6.074 1.221,8.949 0.489,1.331 -1.582,2.057 -2.067,0.731 C -5.181,15.828 -5.75,12.505 -5.355,9.131 -4.939,5.592 -3.536,2.227 -1.981,-0.947 -1.361,-2.215 0.62,-1.271 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1649-6" />
    </g>
    <g id="g1651-2" transform="matrix(0.35277777,0,0,-0.35277777,9.323177,34.11074)" style="fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1">
      <path d="M 0,0 C 1.523,0.283 3.114,0.549 4.656,0.26 6.059,-0.008 7.303,-0.762 8.482,-1.529 9.663,-2.299 10.899,-0.488 9.71,0.287 8.25,1.238 6.727,2.083 4.997,2.416 3.221,2.758 1.374,2.486 -0.387,2.16 -1.774,1.904 -1.388,-0.256 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:#ffffff;stroke-opacity:1" id="path1653-9" />
    </g>
    <g id="g1655-1" transform="matrix(0.35277777,0,0,-0.35277777,9.375527,32.64275)" style="fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1">
      <path d="m 0,0 c 1.523,0.282 3.11,0.55 4.657,0.257 1.402,-0.264 2.644,-1.02 3.822,-1.787 1.18,-0.772 2.419,1.043 1.229,1.816 C 8.25,1.238 6.726,2.081 4.998,2.417 3.218,2.757 1.372,2.485 -0.387,2.161 -1.777,1.903 -1.389,-0.259 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:#ffffff;stroke-opacity:1" id="path1657-2" />
    </g>
    <g id="g1659-7" transform="matrix(0.35277777,0,0,-0.35277777,13.310197,30.56295)">
      <path d="M 0,0 C 0.851,1.292 2.586,1.651 3.88,0.803 5.171,-0.049 5.532,-1.785 4.681,-3.076 3.832,-4.369 2.096,-4.729 0.803,-3.881 -0.489,-3.03 -0.849,-1.295 0,0" style="fill:#2aa8fc;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1661-0" />
    </g>
    <g id="g1663-9" transform="matrix(0.35277777,0,0,-0.35277777,13.630767,30.7807)">
      <path d="M 0,0 C 1.28,1.793 4.05,0.006 2.867,-1.845 1.684,-3.688 -1.141,-1.895 0,0 0.725,1.206 -1.084,2.444 -1.817,1.229 -2.911,-0.584 -2.541,-2.959 -0.719,-4.17 1.041,-5.344 3.516,-4.838 4.683,-3.075 5.85,-1.31 5.354,1.158 3.584,2.326 1.772,3.525 -0.587,2.956 -1.817,1.229 -2.637,0.081 -0.822,-1.152 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1665-3" />
    </g>
    <g id="g1667-6" transform="matrix(0.35277777,0,0,-0.35277777,13.222177,24.04348)">
      <path d="m 0,0 c 1.665,5.196 4.711,10.098 9.663,12.699 4.033,2.117 8.805,2.481 13.195,1.377 2.544,-0.638 4.945,-1.705 7.128,-3.15 1.178,-0.778 2.414,1.035 1.232,1.816 -4.259,2.815 -9.344,4.362 -14.464,4.096 C 11.492,16.564 6.606,14.195 3.118,10.248 0.697,7.509 -0.959,4.196 -2.068,0.73 -2.498,-0.615 -0.431,-1.351 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1669-0" />
    </g>
    <g id="g1671-6" transform="matrix(0.35277777,0,0,-0.35277777,19.467617,35.94144)">
      <path d="m 0,0 c 3.064,-1.57 6.715,-2.866 10.188,-2 2.528,0.633 4.532,2.354 5.537,4.758 2.068,4.957 -0.643,10.752 -5.473,12.799 -3.933,1.67 -8.442,0.798 -12.294,-0.651 -1.32,-0.498 -0.365,-2.476 0.948,-1.981 3.018,1.139 6.576,1.85 9.636,0.917 2.185,-0.662 3.882,-2.077 4.826,-3.966 0.115,-0.23 0.219,-0.467 0.316,-0.706 0.045,-0.122 0.09,-0.24 0.133,-0.361 0.012,-0.033 0.074,-0.226 0.03,-0.09 C 13.803,8.864 13.878,8.612 13.886,8.583 14.027,8.064 14.134,7.535 14.186,7 14.224,6.609 14.216,6.771 14.217,6.438 14.214,6.178 14.208,5.911 14.183,5.65 14.164,5.404 14.128,5.16 14.086,4.916 14.08,4.857 14.068,4.796 14.056,4.736 14.025,4.575 14.094,4.901 14.057,4.742 14.025,4.607 13.992,4.477 13.956,4.344 13.886,4.11 13.81,3.881 13.723,3.658 13.678,3.541 13.631,3.432 13.582,3.321 13.558,3.269 13.533,3.212 13.507,3.158 13.381,2.887 13.615,3.35 13.473,3.088 13.233,2.65 12.959,2.24 12.636,1.863 12.531,1.737 12.757,1.992 12.647,1.873 12.604,1.83 12.565,1.783 12.52,1.742 12.435,1.656 12.35,1.572 12.261,1.488 12.068,1.313 11.865,1.152 11.654,0.996 11.411,0.815 11.669,0.994 11.513,0.898 11.404,0.833 11.299,0.771 11.184,0.71 10.928,0.572 10.661,0.453 10.391,0.344 10.33,0.32 10.268,0.298 10.205,0.275 10.003,0.206 10.275,0.293 10.148,0.258 10,0.211 9.85,0.172 9.699,0.136 9.367,0.058 9.029,0.005 8.687,-0.033 8.103,-0.099 7.355,-0.078 6.628,0.013 4.747,0.246 2.914,0.954 1.233,1.818 0.701,2.088 0.077,2.055 -0.292,1.523 -0.598,1.085 -0.525,0.269 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1673-2" />
    </g>
    <g id="g1675-6" transform="matrix(0.35277777,0,0,-0.35277777,13.187357,38.04022)">
      <path d="m 0,0 c 3.535,-0.161 7.183,-0.131 10.598,0.898 3.259,0.981 6.079,2.796 8.541,5.131 C 20.16,6.998 18.728,8.662 17.7,7.686 15.484,5.584 12.947,3.842 9.985,2.993 6.801,2.076 3.467,2.037 0.183,2.188 -1.229,2.253 -1.411,0.067 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1677-1" />
    </g>
    <g id="g1679-8" transform="matrix(0.35277777,0,0,-0.35277777,17.466517,38.80363)" style="fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1">
      <path d="M 0,0 C -0.416,1.8 -0.913,3.608 -1.96,5.156 -2.92,6.581 -4.302,7.625 -5.716,8.561 -6.893,9.341 -8.131,7.525 -6.95,6.744 -5.744,5.947 -4.532,5.089 -3.718,3.869 -2.872,2.605 -2.495,1.074 -2.161,-0.388 -1.844,-1.762 0.315,-1.379 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:#ffffff;stroke-opacity:1" id="path1681-7" />
    </g>
    <g id="g1683-9" transform="matrix(0.35277777,0,0,-0.35277777,18.792007,38.17318)" style="fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1">
      <path d="M 0,0 C -0.413,1.801 -0.912,3.611 -1.957,5.158 -2.919,6.58 -4.3,7.623 -5.714,8.563 -6.891,9.34 -8.127,7.526 -6.947,6.745 -5.744,5.947 -4.533,5.088 -3.716,3.87 -2.871,2.605 -2.493,1.074 -2.159,-0.385 -1.843,-1.762 0.316,-1.379 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:#ffffff;stroke-opacity:1" id="path1685-2" />
    </g>
    <g id="g1687-0" transform="matrix(0.35277777,0,0,-0.35277777,18.380007,33.89367)">
      <path d="M 0,0 C 0.849,1.294 0.49,3.031 -0.802,3.881 -2.096,4.729 -3.832,4.368 -4.68,3.076 -5.531,1.783 -5.172,0.046 -3.878,-0.805 -2.585,-1.651 -0.849,-1.292 0,0" style="fill:#2aa8fc;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1689-2" />
    </g>
    <g id="g1691-3" transform="matrix(0.35277777,0,0,-0.35277777,18.700537,34.11039)">
      <path d="M 0,0 C 1.095,1.813 0.724,4.19 -1.096,5.401 -2.857,6.574 -5.333,6.069 -6.5,4.306 -7.665,2.54 -7.17,0.072 -5.402,-1.096 -3.587,-2.293 -1.229,-1.724 0,0 0.821,1.149 -0.995,2.381 -1.816,1.232 -3.094,-0.561 -5.868,1.226 -4.684,3.075 -3.5,4.919 -0.675,3.124 -1.816,1.232 -2.543,0.026 -0.732,-1.213 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1693-7" />
    </g>
    <g id="g1695-5" transform="matrix(0.35277777,0,0,-0.35277777,24.915177,31.96031)">
      <path d="m 0,0 c 4.531,3.955 8.087,9.215 8.61,15.336 0.434,5.07 -1.293,10.069 -4.332,14.098 -1.703,2.261 -3.835,4.207 -6.206,5.75 -1.182,0.769 -2.419,-1.045 -1.231,-1.817 3.83,-2.495 6.92,-6.09 8.541,-10.388 C 7.048,18.555 6.754,13.7 4.743,9.443 3.313,6.421 1.064,3.842 -1.44,1.656 -2.501,0.73 -1.066,-0.93 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:none" id="path1697-9" />
    </g>
    <g id="g1699-2" transform="matrix(0.35277777,0,0,-0.35277777,9.017777,23.27936)" style="fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1">
      <path d="m 0,0 c 3.901,7.724 10.123,14.44 17.913,18.338 5.237,2.624 12.61,4.562 17.764,0.899 2.747,-1.952 3.986,-5.231 4.346,-8.579 0.15,-1.406 2.31,-1.01 2.159,0.387 -0.362,3.376 -1.589,6.766 -4.153,9.092 C 35.692,22.266 32.614,23.28 29.485,23.4 21.531,23.695 13.754,19.338 8.023,14.15 3.987,10.495 0.637,6.092 -1.816,1.231 -2.088,0.697 -2.057,0.076 -1.526,-0.293 -1.086,-0.597 -0.269,-0.529 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:#ffffff;stroke-opacity:1" id="path1701-2" />
    </g>
    <g id="g1703-8" transform="matrix(0.35277777,0,0,-0.35277777,10.995937,36.69525)" style="fill:#ffffff;fill-opacity:1;stroke:#ffffff;stroke-opacity:1">
      <path d="M 0,0 C 1.373,2.092 4.186,2.676 6.28,1.301 8.374,-0.074 8.955,-2.886 7.58,-4.98 6.203,-7.072 3.393,-7.654 1.299,-6.279 -0.793,-4.905 -1.375,-2.094 0,0" style="fill:#ffffff;fill-opacity:1;fill-rule:nonzero;stroke:#ffffff;stroke-opacity:1" id="path1705-9" />
    </g>
  </g>
</svg>
EOF
}
