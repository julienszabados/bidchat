class ChatController < ApplicationController
  
  layout 'layouts/chat'
  
  def index
    @users = User.all
  end
  
end