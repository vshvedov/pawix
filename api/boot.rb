require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/param'

Dir.glob('./app/models/*.rb').each { |f| require f }

APP_VERSION = '0.0.1'
