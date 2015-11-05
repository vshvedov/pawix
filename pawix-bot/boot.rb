require 'rack'
require 'active_record'
require 'telegram/bot'
require 'wisper'

Dir.glob('./app/models/*.rb').each { |f| require f }
Dir.glob('./app/subs/*.rb').each { |f| require f }
Dir.glob('./app/pubs/*.rb').each { |f| require f }

BOT_TOKEN = ENV['BOT_TOKEN']
