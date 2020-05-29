#!/bin/bash
# create a spring cloud gateway instance with hostname 's1g' and sso plan name 'angular'
cf create-service p.gateway standard site1-gateway -c '{ "sso": { "plan": "angular" }, "host":"s1g" }'

# bind to the app using the paths in static-route.json
cf bs site1 site1-gateway -c ./static-route.json
