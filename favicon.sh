#!/usr/bin/env bash

set -euo pipefail

size=64
strokewidth=6
center=$(( size / 2 ))
radius=$(( size / 2 - strokewidth / 2 - 1 ))
# sin(45)/2 = sqrt(2)/2 \approx 707/1000
outer_radius=$(( (radius + strokewidth / 2) * 707 / 1000 ))

magick \
  -size "${size}x${size}" \
  xc:none \
  -fill none \
  -stroke "#172880" \
  -strokewidth "$strokewidth" \
  -draw "circle ${center},${center} ${center},$((center - radius))" \
  -draw "stroke-linecap round" \
  -draw "line $((center - outer_radius)),$((center - outer_radius)) $((center + outer_radius)),$((center + outer_radius))" \
  -draw "line $((center - outer_radius)),$((center + outer_radius)) $((center + outer_radius)),$((center - outer_radius))" \
  favicon.png
