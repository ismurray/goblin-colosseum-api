#!/bin/bash
ITEM_ID="Health Potion"
USER_ID=8
TOKEN="BAhJIiU4MDczYTJiOWRiZmM5NGQ1NDIyOTJhYjgyZWZmNzkxNgY6BkVG--84bd84e1a28a191686f22c80a56257fd20d87fcc"

curl "http://localhost:4741/purchases" \
--include \
--request POST \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
--data '{
  "purchase": {
    "item_name": "'"${ITEM_ID}"'"
  }
}'

echo
