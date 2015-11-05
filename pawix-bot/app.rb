require './boot'

Telegram::Bot::Client.run(BOT_TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      service = StartMessagePub.new
      service.subscribe(WelcomeSub.new)
      service.call(message)
    when '/stop'
      kb = Telegram::Bot::Types::ReplyKeyboardHide.new(hide_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id,
                           text: 'Sorry to see you go :( Type /start if you want us back!',
                           reply_markup: kb)
    when 'Awesome!'
      bot.api.send_message(chat_id: message.chat.id,
                           text: 'Nice to hear that! We recorded your walk, and it is *paw*ailable at http://pawix.com/walks/832487464')
    when 'Go to my profile'
      bot.api.send_message(chat_id: message.chat.id,
                           text: 'Your profile is available at http://pawix.com/pawers/94288')
    end
  end
end
