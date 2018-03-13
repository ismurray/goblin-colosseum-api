#!/bin/bash
ID=2
TOKEN="BAhJIiVkMDA4NWM0ZTliZmE2YTFkYjAwMGM1ZTlmNzkxMGI5ZAY6BkVG--1fd536084f7f1a7958b3ee5db1f09fce08038d25"

curl "http://localhost:4741/purchases/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
