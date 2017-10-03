# README

## Shorty
Webb App used for creating short links from Users URLs.

Installation using docker-compose:
1. Replace config/database.yml with config/database.docker.yml
2. Run `docker-compose up -d`
3. Run `docker exec shorty_web_1 rails db:create`
4. Run `docker exec shorty_web_1 rails db:migrate`
5. Run `docker exec shorty_web_1 rails db:migrate RAILS_ENV=test`
