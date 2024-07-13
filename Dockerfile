# Use a base image with a Linux distribution
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    fdisk \
    lvm2 \
    parted \
    util-linux \
    && apt-get clean

RUN mkdir -p /scripts
COPY create_loop_devices.sh /scripts/create_loop_devices.sh
RUN chmod +x /scripts/create_loop_devices.sh

# Run the script on container start
CMD ["/scripts/create_loop_devices.sh"]