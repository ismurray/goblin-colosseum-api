#!/bin/bash
ID=3

curl "http://localhost:4741/games/${ID}" \
  --include \
  --request DELETE \
  # --header "Authorization: Token token=${TOKEN}"

echo
