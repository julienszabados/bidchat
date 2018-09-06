class MessagesChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "messages"
  end

  def unsubscribed
  end
  
  def speak(data)
    html = ApplicationController.render(partial: 'chat/partials/message', locals: {
      user: current_user,
      message: data['message']
    })
    
    ActionCable.server.broadcast 'messages', {message: html}
  end
end
