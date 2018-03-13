#!/bin/bash
ITEM_ID=1
USER_ID=2
TOKEN="BAhJIiU5ODlkNWQxMzA5NzhhZDZmNjNmMWE0NTU1ZWY3MTdiZAY6BkVG--eb02666c670eb29ad218b4ccd427841199d6084c"

curl "http://localhost:4741/purchases" \
--include \
--request POST \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
--data '{
  "purchase": {
    "user_id": "'"${USER_ID}"'",
    "item_id": "'"${ITEM_ID}"'"
  }
}'

echo
