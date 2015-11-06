class UserActionsSub
  def start_message_recieved(payload)
    telegram_id = payload['from']['id']
    first_name = payload['from']['first_name']
    chat_id = payload['chat']['id']

    resp = ApiClient.new.start_msg(telegram_id, first_name)
    result = JSON.parse(resp.body)

    BOT.api.send_message(chat_id: chat_id, text: result['text'])
  end

  def walk_event_recieved(payload)
    telegram_id = payload['from']['id']
    chat_id = payload['chat']['id']

    case payload['text']
    when KBD_SHORT
      duration = 1
    when KBD_REG
      duration = 2
    when KBD_LONG
      duration = 3
    end

    resp = ApiClient.new.walk_event(telegram_id, duration)
    result = JSON.parse(resp.body)
    res_text = "#{result['text']} This is your ▶️#{result['total_walks']}th◀️ walk so far!"
    cal_text = Utils.new.from_array_to_cal(telegram_id)

    BOT.api.send_message(chat_id: chat_id, text: "#{res_text} #{cal_text}")
  end
end
