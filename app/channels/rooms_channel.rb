class RoomsChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "room_#{params[:room_id]}"
  end

  def unsubscribed
  end
  
  def speak(data)
    room = ChatRoom.find_by_id(params[:room_id])    
    message = Message.new(chat_room: room, user: current_user, content: data['message'])
    
    html = ApplicationController.render(partial: 'chat/partials/message', locals: {
      message: message,
      current_user: current_user
    })

    message.save if room.persist?
    
    ActionCable.server.broadcast "room_#{params[:room_id]}", {message: html}
  end
end
