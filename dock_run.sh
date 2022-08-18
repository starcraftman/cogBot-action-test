#!/usr/bin/env sh

/etc/init.d/mariadb start
git clone -b "$1" https://github.com/starcraftman/cogBot
cd cogBot
secrethub inject -i "tests/secrethub/secretConfig.yml" -o "data/config.yml"
secrethub inject -i "tests/secrethub/secretSheets.json" -o "data/service_sheets.json"
python -m pytest --cov=cog --cov=cogdb
