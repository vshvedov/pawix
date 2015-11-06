class UserActionsSub
  def start_message_recieved(payload)
    telegram_id = payload['from']['id']
    first_name = payload['from']['first_name']
    chat_id = payload['chat']['id']

    resp = ApiClient.new.start_msg(telegram_id, first_name)
    result = JSON.parse(resp.body)

    BOT.api.send_message(chat_id: chat_id, text: result['text'])
  end
end
