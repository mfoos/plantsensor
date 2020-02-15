#!/bin/bash
python3 seesaw_soil_simpletest.py | ssh pi@lilguy.local -T "cat  > sensor_out.txt" &
