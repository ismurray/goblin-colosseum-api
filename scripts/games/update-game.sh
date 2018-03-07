#!/bin/bash
BOOLEAN=false
SCORE=7
ID=1

curl "http://localhost:4741/games/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "game": {
      "score": "'"${SCORE}"'"
    }
  }'

echo
