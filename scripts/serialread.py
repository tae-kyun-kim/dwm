#!/bin/python3

import serial

ser = serial.Serial('/dev/ttyACM0', 115200, timeout=None);
while True:
    line = ser.readline()
    result = line.decode('utf-8')
    if(result != ''):
        print(result)
    print(result)
