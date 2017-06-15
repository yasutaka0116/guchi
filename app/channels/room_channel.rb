class RoomChannel < ApplicationCable::Channel
    # identified_by :current_user
  def subscribed
    stream_from params[:room]
    # binding.pry
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ApplicationCable.server.broadcast 'room_channel', {name: current_user.name, data['message']}
    Talk.create!(message: data['message'], send_user_id: current_user.id, room_id: data['id'].to_i)
  end
end
