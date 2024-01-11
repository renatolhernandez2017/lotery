#!/bin/bash
set -e

if [ "$WORKER" == true ]; then
  echo "Iniciando delayed job"
  bin/delayed_job run
else
  rake db:migrate
  rails s -b '0.0.0.0'
fi
