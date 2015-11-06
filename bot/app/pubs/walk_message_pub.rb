class WalkMessagePub
  include Wisper::Publisher

  def call(payload)
    broadcast(:walk_event_recieved, payload)
  end
end
