require './boot'

token = ENV['BOT_TOKEN']
puts '>> Starting the bot loop'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      question = "Hi, #{message.from.first_name}! How was your walk today?"
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: [['Go to my profile'], ['Awesome!', 'So-so...'], ['Send a tip']])
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
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
