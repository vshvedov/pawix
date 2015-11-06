class WelcomeSub
  def start_message_recieved(payload)
    bot = Telegram::Bot::Client.new(BOT_TOKEN)
    first_name = payload['from']['first_name']
    chat_id = payload['chat']['id']
    msg = "Hi, #{first_name}! Thanks for joining Pawix!"
    keyboard = [['Awesome!', 'So-so...'], ['Go to my profile']]
    answers = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: keyboard)

    bot.api.send_message(chat_id: chat_id, text: msg, reply_markup: answers)
  end
end
