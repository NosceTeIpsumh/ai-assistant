class RemoveChatFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_reference :items, :chat, null: false, foreign_key: true
  end
end
