#!/bin/bash
BOOLEAN=false
SCORE=7

curl "http://localhost:4741/games" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "game": {
      "over": "'"${BOOLEAN}"'",
      "score": "'"${SCORE}"'"
    }
  }'

echo
