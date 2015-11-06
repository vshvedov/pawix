require './boot'

class App < Sinatra::Base
  configure do
    if ENV['RACK_ENV'] == 'development'
      register Sinatra::Reloader
    end
  end

  get '/' do
    "(version: #{APP_VERSION} - #{ENV['RACK_ENV']})"
  end
end
