#!/bin/bash
set -e

mongo <<EOF
use $DB_NAME
db.createUser({user: '$DB_USER',pwd:'$DB_PASS',roles:[{role:'readWrite',db:'$DB_NAME'},{role:'read',db:'reporting'}]})
EOF