#!/bin/bash
ITEM_ID="Test"
USER_ID=8
TOKEN="BAhJIiUxYTVlYjYzMjY5NzEyN2VlYmE2ZjJhYjhlNTkyNzIxMAY6BkVG--03643113661ed514b7c1c3d8df184ff34f0f2b1d"

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
