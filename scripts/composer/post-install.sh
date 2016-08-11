#!/usr/bin/env bash

############################
# This script handles symlinking our custom src
# directory into the correct locations under docroot.
#
# This is necessary because running composer install or update
# is a destructive task with Drupal 7 that erases everything
# under the docroot foler.
############################

if [ ! -d "docroot/sites" ]; then
  echo "Site not built, aborting post-install-cmd"
  exit 1
fi

ROOT_DIR=`pwd`
echo "Root Directory ${ROOT_DIR}"

# Create symlinks in docroot folder for custom sources.
echo "Linking the folder sites/all/modules/custom..."
if [ ! -d "${ROOT_DIR}/docroot/sites/all/modules/custom" ]; then
  echo "  Link not found, creating..."
  cd "${ROOT_DIR}/docroot/sites/all/modules"
  ln -s ../../../../src/sites/all/modules/custom/ custom
  cd "${ROOT_DIR}"
fi

echo "Linking the folder sites/all/modules/features..."
if [ ! -d "${ROOT_DIR}/docroot/sites/all/modules/features" ]; then
  echo "  Link not found, creating..."
  cd "${ROOT_DIR}/docroot/sites/all/modules"
  ln -s ../../../../src/sites/all/modules/features/ features
  cd "${ROOT_DIR}"
fi

echo "Linking the settings.php file..."
if [ ! -f "${ROOT_DIR}/docroot/sites/default/settings.php" ]; then
  cd "${ROOT_DIR}/docroot/sites/default"
  ln -s ../../../src/sites/default/settings.php settings.php
  cd "${ROOT_DIR}"
fi
