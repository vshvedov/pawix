require './boot'

class App < Sinatra::Base
  helpers Sinatra::Param

  configure do
    if ENV['RACK_ENV'] == 'development'
      register Sinatra::Reloader
    end
  end

  get '/' do
    { api_version: APP_VERSION, api_env: ENV['RACK_ENV'] }.to_json
  end

  post '/user' do
    request.body.rewind
    payload = JSON.parse(request.body.read)
    user = User.find_by_telegram_id(payload['telegram_id'])

    if user
      res = {
        text: 'Welcome back!',
        calendar: generate_calendar(user.id)
      }
    else
      user = User.create!(telegram_id: payload['telegram_id'],
                          first_name: payload['first_name'])
      res = {
        text: "Welcome to Pawix! We just created a new profile
              for you, available at http://pawix.com/users/#{user.id}"
      }
    end

    res.to_json
  end

  post '/walk' do
    request.body.rewind
    payload = JSON.parse(request.body.read)
    user = User.find_by_telegram_id(payload['telegram_id'])

    if user
      user.walks.create!(duration: payload['duration'])
      res = {
        text: '❤️ Amazing! ❤️',
        total_walks: user.walks.count
      }
    else
      res = {
        text: 'You have to register first. Type /start and repeat!'
      }
    end

    res.to_json
  end

  post '/walks' do
  end

  post '/calendar/:id' do
  end

  private

  def generate_calendar(user_id)
    res = [
      [0,0,0,1,1,1,2],
      [0,1,1,1,1,3,1],
      [1,1,1,1,1,1,1],
      [2,1,1,3,3,0,0]
    ]
  end
end
