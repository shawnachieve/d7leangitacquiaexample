#!/usr/bin/env bash

SOURCE_ALIAS="@d7leangitexample.dev"
TARGET_ALIAS="@d7leangitacquiaexample.www.d7leangitacquiaexample.local"
drush sql-sync "${SOURCE_ALIAS}" "${TARGET_ALIAS}"
