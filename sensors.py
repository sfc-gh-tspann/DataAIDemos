from datetime import datetime, timezone
from scd4x import SCD4X
from icp10125 import ICP10125
from sgp30 import SGP30
import time
import logging
import sys
import subprocess
import os
import traceback
import math
import base64
import json
from time import gmtime, strftime
import random, string
import time
import psutil
import uuid
from time import sleep
from math import isnan
from subprocess import PIPE, Popen
import socket
import argparse
import os.path
import re
import sys
import os
import paho.mqtt
import paho.mqtt.client as mqttClient

# IP Address
def IP_address():
        try:
            s = socket.socket(socket_family, socket.SOCK_DGRAM)
            s.connect(external_IP_and_port)
            answer = s.getsockname()
            s.close()
            return answer[0] if answer else None
        except socket.error:
            return None

# Get MAC address of a local interfaces
def psutil_iface(iface):
    # type: (str) -> Optional[str]
    import psutil
    nics = psutil.net_if_addrs()
    if iface in nics:
        nic = nics[iface]
        for i in nic:
            if i.family == psutil.AF_LINK:
                return i.address
# Random Word
def randomword(length):
 return ''.join(random.choice("ABCDEFGHIJKLMNOPQRSTUVWXYZ".lower()) for i in range(length))

# Get the temperature of the CPU for compensation
def get_cpu_temperature():
    process = Popen(['vcgencmd', 'measure_temp'], stdout=PIPE, universal_newlines=True)
    output, _error = process.communicate()
    return float(output[output.index('=') + 1:output.rindex("'")])

external_IP_and_port = ('198.41.0.4', 53)  # a.root-servers.net
socket_family = socket.AF_INET
# Timer
packet_size=3000

# Tuning factor for compensation. Decrease this number to adjust the
# temperature down, and increase to adjust up
factor = 2.25

host_name = socket.gethostname()
host_ip = socket.gethostbyname(host_name)
ipaddress = IP_address()

try:
    device = SCD4X(quiet=False)
    device.start_periodic_measurement()

    sgp30 = SGP30()
    sgp30.start_measurement()

    deviceicp = ICP10125()
 
    while True:
        currenttime = strftime("%Y-%m-%d %H:%M:%S", gmtime())
        starttime = datetime.now().strftime('%m/%d/%Y %H:%M:%S')
        start = time.time()

        # Create unique id
        uniqueid = 'thrml_{0}_{1}'.format(randomword(3),strftime("%Y%m%d%H%M%S",gmtime()))
        uuid2 = '{0}_{1}'.format(strftime("%Y%m%d%H%M%S",gmtime()),uuid.uuid4())

        # CPU Temp
        f = open("/sys/devices/virtual/thermal/thermal_zone0/temp","r")
        cputemp = str( f.readline() )
        cputemp = cputemp.replace('\n','')
        cputemp = cputemp.strip()
        cputemp = str(round(float(cputemp)) / 1000)
        cputempf = str(round(9.0/5.0 * float(cputemp) + 32))
        f.close()

        usage = psutil.disk_usage("/")
        end = time.time()

        co2, temperature, relative_humidity, timestamp = device.measure()
        dateTimeStamp = datetime.fromtimestamp(timestamp, timezone.utc)

        result = sgp30.get_air_quality()
        pressure, temperatureicp = deviceicp.measure()
        row = { }

        row['uuid'] = uniqueid
        row['ipaddress'] = ipaddress
        row['cputempf']= int(cputempf)
        row['runtime'] =  int(round(end - start))
        row['host'] = os.uname()[1]
        row['hostname'] = host_name
        row['macaddress'] = psutil_iface('wlan0')
        row['endtime'] = '{0}'.format( str(end ))
        row['te'] = '{0}'.format(str(end-start))
        row['cpu'] = psutil.cpu_percent(interval=1)
        row['diskusage'] = "{:.1f} MB".format(float(usage.free) / 1024 / 1024)
        row['memory'] = psutil.virtual_memory().percent
        row['rowid'] = str(uuid2)
        row['systemtime'] = datetime.now().strftime('%m/%d/%Y %H:%M:%S')
        row['ts'] =  int( time.time() )
        row['starttime'] = str(starttime)
        row['datetimestamp'] = str(dateTimeStamp)
        row['temperature'] = round(float(temperature),4)
        row['humidity'] = round(float(relative_humidity),2)
        row['co2'] =  round(float(co2),2)
        row['equivalentco2ppm'] = round(float(result.equivalent_co2),5)
        row['totalvocppb'] = round(float(result.total_voc),3)
        row['pressure'] = round(pressure,2)

        icptempf = (round(9.0/5.0 * float(temperatureicp) + 32))

        row['temperatureicp'] = round(float(icptempf),2)
        json_string = json.dumps(row)
        fa=open("/opt/demo/logs/thermal.log", "a+")
        fa.write(json_string + "\n")
        fa.close()
        print(json_string)
        if paho.mqtt.__version__[0] > '1':
             client = mqttClient.Client(mqttClient.CallbackAPIVersion.VERSION1)
        else:
             client = mqttClient.Client()
        client.connect("192.168.1.1", 1883, 60)
        client.publish("thermalsensors", payload=json_string, qos=0, retain=True)
        time.sleep(5)

except KeyboardInterrupt:
    pass
