#!/bin/bash

output_file="docker-compose.yml"

echo "version: '3'" > "$output_file"
echo "services:" >> "$output_file"

# Serviço vss-referee
cat <<EOF >> "$output_file"
  vss-referee:
    image: ersaraujo/vss-referee:latest
    environment:
      - DISPLAY=\$DISPLAY
    network_mode: host
    tty: true
EOF

# Serviço vss-vision
cat <<EOF >> "$output_file"
  vss-vision:
    image: ersaraujo/vss-vision:latest
    environment:
      - DISPLAY=\$DISPLAY
    network_mode: host
    volumes:
      - vss-vision-config:/opt/vss-vision/src/Config
    tty: true
    devices:
EOF

video_devices=(/dev/video*)
for device in "${video_devices[@]}"; do
    cat <<EOF >> "$output_file"
      - $device:$device
EOF
done

echo "volumes:" >> "$output_file"
echo "  vss-vision-config:" >> "$output_file"

echo "File $output_file generated successfully."
