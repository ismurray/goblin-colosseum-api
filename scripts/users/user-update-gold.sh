#!/bin/bash
TOKEN="BAhJIiVhN2FlYWE3MjU0NTg3Zjg0NWQ2YTgyOTliNTU2MDUyMwY6BkVG--e3d8f024025ea199f49ab164891f64c05069bad6"
ID=2
AMOUNT=1

curl "http://localhost:4741/gold-transaction/${AMOUNT}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \


echo
