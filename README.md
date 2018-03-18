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

### Setting Up
download [nanobox](https://nanobox.io/)

`nanobox dns add local nano.local`
`nanobox start`

Starting
`nanobox run rails server -b 0.0.0.0`
once running you can access via <http://nano.local:3000>

Stopping
just `CTRL + C` the nanobox server running

logging
nanobox stays in the forground - so you can see those logs

terminal
`nanobox run`

console
`nanobox run rails c`
