#!/usr/bin/env bash
tools/esptool.py --chip esp32 --port $1 --baud 921600 erase_flash
tools/esptool.py --chip esp32 --port $1 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_freq 80m --flash_mode dio --flash_size 4MB \
0x0000 firmware/bootloader.bin \
0x10000 firmware/firmware.bin \
0x290000 firmware/spiffs.bin