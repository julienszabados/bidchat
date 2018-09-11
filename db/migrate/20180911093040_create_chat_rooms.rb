class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.string :description
      t.boolean :persist

      t.timestamps
    end
  end
end
