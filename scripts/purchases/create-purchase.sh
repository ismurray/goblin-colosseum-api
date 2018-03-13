#!/bin/bash
ITEM_ID=1
USER_ID=2
TOKEN="BAhJIiVmODBjZGFlM2MzNDAwNjM1N2ZlMzU2MWE1OTJjM2NlYgY6BkVG--08da48e95ea64ce15ffc625a071cf824799084ad"

curl "http://localhost:4741/purchases" \
--include \
--request POST \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
--data '{
  "purchase": {
    "item_id": "'"${ITEM_ID}"'"
  }
}'

echo
