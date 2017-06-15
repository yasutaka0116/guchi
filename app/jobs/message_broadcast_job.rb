class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    # Do something later
       ActionCable.server.broadcast "room_#{data.room_id}", {name: data.send_user_id , message: data.message}
  end
end
