# Use a base image with a Linux distribution
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    fdisk \
    lvm2 \
    parted \
    util-linux \
    && apt-get clean