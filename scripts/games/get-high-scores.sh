#!/bin/bash
TOKEN="BAhJIiUzZWEwMzA3ZjUzZWMxMTYxYjQyOThjZTA4ODA2NjAzZgY6BkVG--fe602ad422a9423a2c1326972e958fe02b9a1409"

curl "http://localhost:4741/high-scores/10" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
