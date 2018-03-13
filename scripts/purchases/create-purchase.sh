#!/bin/bash
ITEM_ID=1
USER_ID=2
TOKEN="BAhJIiVhN2FlYWE3MjU0NTg3Zjg0NWQ2YTgyOTliNTU2MDUyMwY6BkVG--e3d8f024025ea199f49ab164891f64c05069bad6"

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
