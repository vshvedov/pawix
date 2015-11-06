require 'telegram/bot'
require 'wisper'
require 'faraday'

require './texts'
require './api_client'

Dir.glob('./app/subs/*.rb').each { |f| require f }
Dir.glob('./app/pubs/*.rb').each { |f| require f }

BOT_TOKEN = ENV['BOT_TOKEN']
BOT = Telegram::Bot::Client.new(BOT_TOKEN)
