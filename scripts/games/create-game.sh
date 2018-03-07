#!/bin/bash
BOOLEAN=false
SCORE=7
USER_ID=2

curl "http://localhost:4741/games" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "game": {
      "over": "'"${BOOLEAN}"'",
      "score": "'"${SCORE}"'",
      "user_id": "'"${USER_ID}"'"
    }
  }'

echo
