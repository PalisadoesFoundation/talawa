#!/bin/bash

echo "Step 1: Fetching all PR reviews..."

response=$(curl -s -f -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}/reviews?per_page=1000") || {
  echo "Error: Failed to fetch reviews from GitHub API"
  exit 1
}

latest_reviews=$(echo "$response" | jq -c '[.[]] | group_by(.user.login) | map(max_by(.submitted_at))') || {
  echo "Error: Failed to process reviews JSON"
  exit 1
}

if [ "$latest_reviews" = "null" ] || [ -z "$latest_reviews" ]; then
  echo "Error: Invalid reviews data"
  exit 1
fi

echo "Step 2: Checking approval status of 'coderabbitai[bot]'..."
approval_state=$(echo "$latest_reviews" | jq -r '[.[] | select(.user.login == "coderabbitai[bot]" and .state == "APPROVED")] | length')

if [[ "$approval_state" =~ ^[0-9]+$ ]] && [[ $approval_state -gt 0 ]]; then
  echo "Success: PR approved by CodeRabbit.ai."
else
  echo ""
  echo "ERROR:"
  echo ""
  echo "1) This PR is not approved by CodeRabbit.ai."
  echo "2) In the 'Add a comment' section at the bottom"
  echo "   of the PR web page, add a comment with the"
  echo "   statement below to restart a review"
  echo ""
  echo "   @coderabbitai full review"
  echo ""  
  exit 1
fi
