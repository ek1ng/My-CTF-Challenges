#!/bin/bash
set -ex

wait-for-it 127.0.0.1:3306 -t 60 -- echo "database is connected"
if [[ ! -e ".env" ]]; then
    echo -e "127.0.0.1\nv2board\nroot\nroot\nadmin@example.com\nexample123" | php artisan v2board:install
    sed -i 's/REDIS_HOST=.*/REDIS_HOST=127.0.0.1/g' .env
fi

chown www-data:www-data -R /var/www/html
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- apache2-foreground "$@"
fi

exec "$@"
