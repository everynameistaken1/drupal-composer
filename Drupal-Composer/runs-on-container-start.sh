#!/bin/sh

# Prepare variables
# Credentials
#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- php-fpm "$@"
fi

echo "Checking if table <$TABLE_EXISTS> exists...";

# To make sure the db is ready...
sleep 10;

# Add instructions here

exec "$@"

