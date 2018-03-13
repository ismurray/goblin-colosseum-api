#!/bin/bash
TOKEN="BAhJIiVhN2FlYWE3MjU0NTg3Zjg0NWQ2YTgyOTliNTU2MDUyMwY6BkVG--e3d8f024025ea199f49ab164891f64c05069bad6"

curl "http://localhost:4741/purchases" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
