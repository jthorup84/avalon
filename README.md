# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Setting Up
`docker-compose run social-deduction rails db:setup`

Starting
`docker-compose up -d`
once running you can access via <http://localhost:3000>

Stopping
`docker-compose down`

__In order for the following commands to work the application needs to be running__
logging
`docker-compose logs -f social-deduction`

terminal
`docker-compose exec social-deduction bash`

console
`docker-compose exec social-deduction rails c`
