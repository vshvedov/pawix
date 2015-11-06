class WelcomeSub
  def start_message_recieved(payload)
    first_name = payload['from']['first_name']
    chat_id = payload['chat']['id']
    msg = "🐾🐾🐾 Hi, #{first_name}! 🐾🐾🐾"
    keyboard = [[KBD_SHORT, KBD_REG, KBD_LONG], [KBD_PROFILE, KDB_PROG]]
    answers = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: keyboard)

    BOT.api.send_message(chat_id: chat_id, text: msg, reply_markup: answers)
  end
end
