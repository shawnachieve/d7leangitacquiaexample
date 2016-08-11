#!/usr/bin/env bash

# Get site drush alias.
DRUSH_ALIAS=`drush sa --local-only | grep "www."`
echo "Drush Alias: ${DRUSH_ALIAS}"

# Get site URL.
SITE_URL=`drush sa --format=csv --fields=uri ${DRUSH_ALIAS}`
echo "Site URL: ${SITE_URL}"

# Create SSL Certificate for site.
if [ ! -f /etc/ssl/certs/drupalvm.crt ]; then
  echo "Creating new SSL Certificate..."
  sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/drupalvm.key -out /etc/ssl/certs/drupalvm.crt -subj "/O=Achieve Internet/OU=Achieve Internet/CN=${SITE_URL}"
fi

# Import database.
