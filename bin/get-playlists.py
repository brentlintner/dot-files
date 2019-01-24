#!/usr/bin/env python

import requests
import os

r = requests.get('http://bmacmini:33400/api/v3/playlists/List')
print(r.status_code)
print(r.content)

# url = 'http://bmacmini:33400/api/v3/playlists/List'
# payload = open("request.json")
# headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
# r = requests.post(url, data=payload, headers=headers)
