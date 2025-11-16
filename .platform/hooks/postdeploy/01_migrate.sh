#!/bin/bash

# Підтягуємо змінні оточення EB
. /opt/elasticbeanstalk/support/envvars

cd /var/app/staging || exit

echo "--- Running bundle install ---"
bundle install --without development test

echo "--- Running database migrations ---"
bundle exec rails db:migrate

echo "--- Restarting Puma server ---"
sudo systemctl restart web.service || true
