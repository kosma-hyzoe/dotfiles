#!/usr/bin/python3.11

import time
import os


def main():
    while True:
        with open("/sys/class/power_supply/BAT0/capacity", 'r') as f:
            battery_level = int(f.read().strip())

        with open("/sys/class/power_supply/BAT0/status", 'r') as f:
            battery_status = f.read().strip()

        if battery_level >= 80 and battery_status == "Charging":
            os.system('notify-send "Battery level over 80%"')

        time.sleep(60)


if __name__ == "__main__":
    main()

