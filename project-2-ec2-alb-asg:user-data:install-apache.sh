#!/bin/bash
set -e

# Install Apache
dnf update -y || yum update -y
dnf install -y httpd || yum install -y httpd
systemctl enable httpd
systemctl start httpd

# IMDSv2 token (works whether tokens are required or not)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" || true)

# Helper to query metadata with token (falls back if token not available)
md() {
  if [ -n "$TOKEN" ]; then
    curl -s -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/$1"
  else
    curl -s "http://169.254.169.254/latest/meta-data/$1"
  fi
}

INSTANCE_ID=$(md instance-id)
AZ=$(md placement/availability-zone)
HOST=$(hostname)

cat > /var/www/html/index.html <<EOF
<h1>Project 2: ALB + ASG ✅</h1>
<p><b>Instance:</b> ${INSTANCE_ID}</p>
<p><b>AZ:</b> ${AZ}</p>
<p><b>Hostname:</b> ${HOST}</p>
EOF