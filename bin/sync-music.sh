FROM_PATH="/home/brent/Music"
TO_PATH="brent@bmacmini:/Volumes/backup/bnixbook-music"
SSH_OPTS="ssh -o Compression=no"

rsync -e "$SSH_OPTS" -h -r -t -v --progress $FROM_PATH $TO_PATH
