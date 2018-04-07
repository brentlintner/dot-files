FROM_PATH="/home/brent/Images"
TO_PATH="brent@bmacmini:/Volumes/backup/bnixbook-images"
SSH_OPTS="ssh -o Compression=no"

rsync -e "$SSH_OPTS" -h -r -t -v --progress $FROM_PATH $TO_PATH
