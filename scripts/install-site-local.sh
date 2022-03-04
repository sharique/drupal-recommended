#!/usr/bin/env bash

set -ev

echo "Installing site "
lando drush si --existing-config -y
lando drush cset system.site uuid 412f1464-308d-43d7-acd4-171e242c16ee -y
lando drush entity:delete shortcut -y

echo "Importing configuration"
lando drush cim -y

echo "Importing default content"
lando drush dcdi -v -y

echo "Clearing cache"
lando drush cr

set +v