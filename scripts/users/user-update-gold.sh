#!/bin/bash
TOKEN="BAhJIiU3MDJmMzdkNTEwNzBlNTE2OTNiNDk0YjY1ODNhMjNmMgY6BkVG--7237123b760fb246a2e54bfb2a6e7c71d29bad92"
ID=2
AMOUNT=1

curl "http://localhost:4741/gold-transaction/${AMOUNT}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \


echo
