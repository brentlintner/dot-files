#!/usr/bin/env python

import requests
import os
import sys
import json
import base64

PLEX_USER    = "" # sys.argv[1]
PLEX_PASS    = "" # sys.argv[2]
SERVER_URL   = "http://bmacmini:33400/"
API_URL      = SERVER_URL + "api/v3/"
DOWNLOAD_DIR = os.path.join(os.path.expanduser("~"), "Downloads")

# TODO: ugh weirdness, just log into WebTools with your browser and set cookie ENV var before calling
cookies = { "WebTools": os.environ["WEBTOOLS_COOKIE"] }
# def login_user(req):
  # authtxt = base64.b64encode('{}:{}'.format(PLEX_USER, PLEX_PASS).encode()).decode("ascii")
  # headers = { "Authorization": "Basic %s" % authtxt }
  # res = req.post(SERVER_URL + 'login', headers=headers)
  # print("LOGIN")
  # print(requests.utils.dict_from_cookiejar(res.cookies))
  # if res.status_code != 200:
    # raise Exception("login returned {}".format(res.status_code))

def check_version(req):
  print("CHECK")
  res = req.get(SERVER_URL + 'version')
  if res.status_code != 200:
    raise Exception("server not online? (got {})".format(res.status_code))
  data = res.json()
  print(json.dumps(data, indent=4))

def get_playlists(req):
  res = req.get(API_URL + 'playlists/List', cookies=cookies)
  print("GET PLAYLISTS")
  if res.status_code != 200:
    raise Exception("could not download playlists {}".format(res.status_code))
  return res.json()

def download_playlists(playlists, req):
  print("DOWNLOAD PLAYLISTS")
  for playlist_key in playlists:
    playlist = playlists[playlist_key]
    url = "playlists/download/key/" + playlist_key
    playlist_file = playlist["title"] + ".m3u8"
    playlist_file_download_path = os.path.join(DOWNLOAD_DIR, playlist_file)
    print("downloading " + playlist_file)
    res = req.get(API_URL + url, cookies=cookies, allow_redirects=True)
    f = open(playlist_file_download_path, 'wb')
    f.write(res.content)
    f.close()

def main():
  req = requests.session()
  check_version(req)
  # login_user(req)
  playlists = get_playlists(req)
  download_playlists(playlists, req)

main()
