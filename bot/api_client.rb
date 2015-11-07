class ApiClient
  def initialize
    @connection ||= Faraday.new(url: 'http://pawix_api:9292') do |faraday|
      faraday.response(:logger)
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def start_msg(telegram_id, first_name)
    payload = {
      telegram_id: telegram_id,
      first_name: first_name
    }

    @connection.post('/user', payload.to_json)
  end

  def walk_event(telegram_id, duration)
    payload = {
      telegram_id: telegram_id,
      duration: duration
    }

    @connection.post('/walk', payload.to_json)
  end
end
