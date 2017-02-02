#! /bin/bash

#source /home/ubuntu/git/twilio/twilio-text/devbox-env

set -e
LOGFILE=/var/log/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=5
NUM_THREADS=25
# user/group to run as
USER=www-data
GROUP=www-data
cd /home/ubuntu/git/twilio/twilio-text/iss
test -d $LOGDIR || mkdir -p $LOGDIR
exec gunicorn iss.wsgi -w $NUM_WORKERS --threads $NUM_THREADS \
  --user=$USER --group=$GROUP --log-level=debug --max-requests=1000 \
  --log-file=$LOGFILE
