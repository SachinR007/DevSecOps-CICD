#!/bin/bash
# Run a CloudSploit scan after infra is created

echo "Running CloudSploit scan..."
docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
  aquasec/cloudsploit scan --console
