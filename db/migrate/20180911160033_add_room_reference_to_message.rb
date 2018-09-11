class AddRoomReferenceToMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :chat_room, foreign_key: true, index: true
    add_reference :messages, :user, foreign_key: true, index: true
  end
end
