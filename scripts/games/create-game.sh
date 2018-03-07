#!/bin/bash
BOOLEAN=true
SCORE=11
USER_ID=2
TOKEN="BAhJIiVkMDA4NWM0ZTliZmE2YTFkYjAwMGM1ZTlmNzkxMGI5ZAY6BkVG--1fd536084f7f1a7958b3ee5db1f09fce08038d25"

curl "http://localhost:4741/games" \
--include \
--request POST \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
  --data '{
    "game": {
      "over": "'"${BOOLEAN}"'",
      "score": "'"${SCORE}"'",
      "user_id": "'"${USER_ID}"'"
    }
  }'

echo
