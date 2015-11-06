require './boot'

Telegram::Bot::Client.run(BOT_TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      service = StartMessagePub.new
      service.subscribe(WelcomeSub.new)
      service.subscribe(UserActionsSub.new)
      service.call(message)
    when '/stop'
      kb = Telegram::Bot::Types::ReplyKeyboardHide.new(hide_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id,
                           text: 'Sorry to see you go :( Type /start if you want us back!',
                           reply_markup: kb)
    when KBD_PROFILE
      bot.api.send_message(chat_id: message.chat.id,
                           text: 'Your profile is available at http://pawix.com/users/1')
    when KBD_SHORT
    when KBD_REG
    when KBD_LONG
    end
  end
end
