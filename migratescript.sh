#!/bin/bash
sleep 10
#take in argument for mode (dev or prod)
npm run migratedb:$1
#fix for rest of arguments concerning client
shift 1
#node run.js
exec "$@"
