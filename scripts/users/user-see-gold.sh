#!/bin/bash
TOKEN="BAhJIiUxM2Y0NDExNjc2ZWQ3NTZlZDBmMjhhZTJmZDRkNjI4YwY6BkVG--8a7c651c4ba71c0207c8ffe33c716218a4a36b5f"
ID=2
AMOUNT=1

curl "http://localhost:4741/gold" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \


echo
