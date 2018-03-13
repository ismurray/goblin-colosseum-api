#!/bin/bash
NAME="test"
SCORE=11
USER_ID=2
TOKEN="BAhJIiU5ODlkNWQxMzA5NzhhZDZmNjNmMWE0NTU1ZWY3MTdiZAY6BkVG--eb02666c670eb29ad218b4ccd427841199d6084c"

curl "http://localhost:4741/items" \
--include \
--request POST \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
--data '{
  "item": {
    "name": "'"${NAME}"'"
  }
}'

echo
