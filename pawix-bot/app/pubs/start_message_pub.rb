class StartMessagePub
  include Wisper::Publisher

  def call(payload)
    broadcast(:start_message_recieved, payload)
  end
end
