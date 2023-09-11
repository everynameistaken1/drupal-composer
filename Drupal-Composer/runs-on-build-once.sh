#!/bin/sh

# Runs after composer create

#!/bin/sh
set -e

# Add instructions here

# Example, installing drush and devel
cd $PROJECT_NAME
composer require --dev --no-interaction --with-all-dependencies drush/drush drupal/devel