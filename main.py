from prometheus_client import CollectorRegistry, Gauge, push_to_gateway


import schedule
import time
import socket
import os
from datetime import datetime

def influx():
    print("starting")
    registry = CollectorRegistry()
    meminfo = dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i in open('/proc/meminfo').readlines())
    freemem = meminfo['MemFree'] / 1024 /1024
    print(freemem)
    g = Gauge('free_mem', 'Free memory available', registry=registry)
    print(g)
    g.set(freemem)
    push_to_gateway('localhost:9091', job='batchA', registry=registry)

schedule.every(5).seconds.do(influx)
while 1:
   schedule.run_pending()
   time.sleep(1)
