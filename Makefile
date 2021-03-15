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
	docker-compose run --rm app bundle install --jobs=16 --retry=3

up:
	docker-compose up --force-recreate

up-detach:
	docker-compose up -d

sh:
	docker-compose run --rm app sh

bash:
	docker-compose run --rm app bash

console:
	docker-compose run --rm app bundle exec rails console

reset:
	docker-compose run --rm web bundle exec rake db:drop db:create db:schema:load
	# docker-compose run --rm web bundle exec rake db:seed

reset-test:
	docker-compose run --rm app bundle exec rake db:drop RAILS_ENV=test
	docker-compose run --rm app bundle exec rake db:create RAILS_ENV=test
	docker-compose run --rm app bundle exec rake db:schema:load RAILS_ENV=test

migrate:
	docker-compose run --rm web bundle exec rake db:migrate
	docker-compose run -e RAILS_ENV=test web bundle exec rake db:migrate

stop:
	docker-compose stop

rspec:
	docker-compose run -e RAILS_ENV=test app rspec

test: reset-test rspec

swaggerize:
	docker-compose run web rake rswag:specs:swaggerize