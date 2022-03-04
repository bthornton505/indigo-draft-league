aws_profile = asird
project_name = asird-api

setup: rebuild
start: up
stop: clean
restart: clean build up
rebuild: build reset
rebuild-clean: super-clean rebuild

clean:
	docker-compose rm --force --stop -v

super-clean: clean
	docker system prune --all --force --volumes

build: clean docker-build bundle

docker-build:
	docker-compose build

docker-build-no-cache:
	docker-compose build --pull --no-cache

bundle:
	docker-compose run -l traefik.enable=false --rm web bundle install

up: docker-compose up --force-recreate

sh:
	docker-compose run -l traefik.enable=false --rm web sh

bash:
	docker-compose run -l traefik.enable=false --rm web bash

console:
	docker-compose run -l traefik.enable=false --rm web bundle exec rails console

reset: purge seed migrate reset-test

reset-test:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake db:drop RAILS_ENV=test
	docker-compose run -l traefik.enable=false --rm web bundle exec rake db:create RAILS_ENV=test
	docker-compose run -l traefik.enable=false --rm web bundle exec rake db:schema:load RAILS_ENV=test

purge: clear-temp
	docker-compose run -l traefik.enable=false --rm web bundle exec rake db:drop db:create

purge-data:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake rake db:drop db:create db:schema:load

restore:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake restore

seed: restore

migrate:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake db:migrate

rollback:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake db:rollback

test:
	docker-compose run -l traefik.enable=false --rm -e RAILS_ENV=test web bundle exec rake ci

cc-before:
	docker-compose -f docker-compose-ci.yml run --rm web bin/cc-test-reporter before-build

cc-after:
	docker-compose -f docker-compose-ci.yml run --rm web bin/cc-test-reporter after-build

ci-build:
	docker-compose -f docker-compose-ci.yml build

ci-reset:
	docker-compose -f docker-compose-ci.yml run --rm web bundle exec rake db:drop db:create db:schema:load

ci-test:
	docker-compose -f docker-compose-ci.yml run --rm web bundle exec rake ci

ci: ci-build ci-reset ci-test

fix:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake rubocop_autofix

guard:
	docker-compose run -l traefik.enable=false --rm -e RAILS_ENV=test web bundle exec guard

swaggerize:
	docker-compose run -l traefik.enable=false --rm -e RAILS_ENV=test web bundle exec rake rswag:specs:swaggerize

erd:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake erd

azuredb:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake azuredb

dbconvert: purge seed
	docker-compose run -l traefik.enable=false --rm web bundle exec rake dbconvert

dbbackup:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake dbbackup

sops-development:
	docker-compose run -l traefik.enable=false --rm web sops .env.development

sops-staging:
	docker-compose run -l traefik.enable=false --rm web sops .env.staging

sops-production:
	docker-compose run -l traefik.enable=false --rm web sops .env.production

clear-temp:
	docker-compose run -l traefik.enable=false --rm web bundle exec rails log:clear tmp:clear

chown:
	docker-compose run -l traefik.enable=false --rm web chown -R 1000:1000 .

purge-redis:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake flushredis

reset-roles:
	docker-compose run -l traefik.enable=false --rm web bundle exec rake reset_roles

routes:
	docker-compose run -l traefik.enable=false --rm web rails routes

.PHONY: web bin config db lib log public spec storage swagger tmp vendor erd