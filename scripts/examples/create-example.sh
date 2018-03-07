#!/bin/bash
TOKEN="BAhJIiVkMDA4NWM0ZTliZmE2YTFkYjAwMGM1ZTlmNzkxMGI5ZAY6BkVG--1fd536084f7f1a7958b3ee5db1f09fce08038d25"
TEXT='test2'

curl "http://localhost:4741/examples" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "example": {
      "text": "'"${TEXT}"'"
    }
  }'

echo
