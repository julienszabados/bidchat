class ChatController < ApplicationController
  
  layout 'layouts/chat'
  
  def index
    @users = User.all
    @chat_rooms = ChatRoom.all
  end
  
end