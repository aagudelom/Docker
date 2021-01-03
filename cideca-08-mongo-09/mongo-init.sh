#!/bin/bash
set -e
file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local def="${2:-}"
	if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
		echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
		exit 1
	fi
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		val="$(< "${!fileVar}")"
	fi
	export "$var"="$val"
	unset "$fileVar"
}
file_env "MONGO_PASSWORD"
mongo <<EOF
const MONGO_PASSWORD = '$MONGO_PASSWORD';
use $DB_NAME
db.createUser({user: '$DB_USER',pwd:'$MONGO_PASSWORD',roles:[{role:'readWrite',db:'$DB_NAME'},{role:'read',db:'reporting'}]})
EOF