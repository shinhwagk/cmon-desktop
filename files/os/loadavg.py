import sys
import os

try:
    with open(os.path.join('/proc/loadavg'), 'r') as file:
        val = file.readline().split(" ")
        [val[0], val[1], val[2]]
except IOError as e:
    print('ERROR: %s' % e)


import httplib
import urllib
params = urllib.urlencode(
    {'@number': 12524, '@type': 'issue', '@action': 'show'})
headers = {"Content-type": "application/JSON"}
conn = httplib.HTTPConnection("alarmtemplate.cmon.org")
conn.request("POST", "/v1/alarmtemplate/%s" % "a", params, headers)
response = conn.getresponse()
print response.status, response.reason
data = response.read()
conn.close()
