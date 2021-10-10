#!/bin/bash
echo $DATABASE_URL
postgre_user_host=$(echo $DATABASE_URL | cut -d : -f 3)
export POSTGRE_PASSWORD=$(echo $postgre_user_host | cut -d @ -f 1)
export POSTGRE_HOST=$(echo $postgre_user_host | cut -d @ -f 2)
export POSTGRE_USER=$(echo $DATABASE_URL | cut -d : -f 2 | sed 's/\///g')
export POSTGRE_NAME=$(echo $DATABASE_URL | cut -d \/ -f 4)
heroku config:set POSTGRE_PASSWORD=$POSTGRE_PASSWORD POSTGRE_USER=$POSTGRE_USER POSTGRE_HOST=$POSTGRE_HOST POSTGRE_NAME=$POSTGRE_NAME -a food-ke-labeling
echo $POSTGRE_USER
echo $POSTGRE_PASSWORD
echo $POSTGRE_HOST
echo $POSTGRE_NAME
label-studio --host ${HOST:-""} --port ${PORT} --username ${USERNAME} --password ${PASSWORD}
