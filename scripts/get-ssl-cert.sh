#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "❌ no args, example: $0 example.com"
  exit 1
fi

DOMAIN="$1"

echo "🔧 Getting cert: $DOMAIN"

# 
echo "⛔ Stop nginx..."
sudo systemctl stop nginx

#  Certbot (standalone)
echo "📡 Fethching a cert..."
sudo certbot certonly --standalone -d "$DOMAIN" --non-interactive --agree-tos -m me@nowhere.wtf

# 
echo "✅ Start nginx..."
sudo systemctl start nginx

echo "🎉 Done! Cert for $DOMAIN saved /etc/letsencrypt/live/$DOMAIN/"
