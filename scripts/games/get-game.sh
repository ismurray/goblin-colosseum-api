#!/bin/bash
ID=2

curl "http://localhost:4741/games/${ID}" \
  --include \
  --request GET \
  # --header "Authorization: Token token=${TOKEN}"

echo
