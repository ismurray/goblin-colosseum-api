#!/bin/bash
TOKEN=bf7099bfabf06744c8b143c79bc6ddaf463bde80804176d4368580a4164f2995a0c1f5c48fe71dfd4a6a56933f9d2f87ab9d15d912e27498de5cf83bf63dc5e9
TEXT='test'

curl "http://localhost:4741/examples" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "example": {
      "text": "'"${TEXT}"'"
    }
  }'

echo
