#!/bin/sh
# Run this script with sudo.
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com \
  && pacman-key --lsign-key FBA220DFC880C036 \
  && pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' \
  && echo "Append this to the end of /etc/pacman.conf:" \
  && echo "[chaotic-aur]" \
  && echo "Include = /etc/pacman.d/chaotic-mirrorlist"
