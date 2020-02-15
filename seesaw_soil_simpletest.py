import time
import sys
from datetime import datetime

from board import SCL, SDA
import busio

from adafruit_seesaw.seesaw import Seesaw

i2c_bus = busio.I2C(SCL, SDA)

ss = Seesaw(i2c_bus, addr=0x36)

while True:
    # read moisture level through capacitive touch pad
    touch = ss.moisture_read()

    # read temperature from the temperature sensor
    temp = ss.get_temp()

    # get and format time
    n = datetime.now()
    t = datetime.strftime(n, "%b-%d-%Y %H:%M:%S")

#    with open(sys.argv[1], "a+") as f:
#        print(t, " temp: " + str(temp) + "  moisture: " + str(touch), file=f)
#        time.sleep(1)

    print(t, " temp: " + str(temp) + "  moisture: " + str(touch))
