#!/bin/bash
python3 seesaw_soil_simpletest.py | ssh pi@lilguy.local -T "cat  > plantsensor/sensor_out.txt" &
