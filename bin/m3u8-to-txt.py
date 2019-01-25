#!/usr/bin/env python

# converts a .m3u8 (Plex) => .txt (Pulsar for Android)

import sys
import os
import urllib.parse
import re
import time

filepath = sys.argv[1]
sd_card_music="/storage/3366-6437/Music"
plex_playlist_prefix="/Volumes/backup/bnixbook-music/Music"

if not os.path.isfile(filepath):
  print("File path {} does not exist. Exiting...".format(filepath))
  sys.exit()

fp = open(filepath)
lines = []
cnt = 0
pattern = r"^[^\#]"

for line in fp:
  cnt += 1
  if re.search(pattern, line) is not None:
    f_line = urllib.parse.unquote(line).replace("\n", "")
    f_line = f_line.replace(plex_playlist_prefix, sd_card_music)
    #print("{}: {}".format(cnt, f_line))
    lines.append(f_line)

fp.close()

new_filepath = filepath.replace(".m3u8", "_{}.txt".format(int(time.time())))
fo = open(new_filepath, "w")

for line in lines:
  fo.write(line + "\n")
fo.close()

print("Wrote {} entries to {}".format(len(lines), new_filepath))
