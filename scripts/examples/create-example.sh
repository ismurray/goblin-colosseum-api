#!/bin/bash
TOKEN="BAhJIiU5YjFhODgzOTYxOTkyNjJmYzFlNTZiNDVmYTk0MTJlMQY6BkVG--4099c0e1aa4dcd78cb52e5015e22ca63e56ed86b"
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
