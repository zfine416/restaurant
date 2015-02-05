# Make sure we load all the gems
require 'bundler'
Bundler.require :default

# Then connect to the database
set :database, {
  adapter: "postgresql", database: "restaurant_db"
}

require './app'
run Restaurants
