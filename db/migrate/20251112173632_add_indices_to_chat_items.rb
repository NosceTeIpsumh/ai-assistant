class AddIndicesToChatItems < ActiveRecord::Migration[7.1]
  def change
    add_column :chat_items, :indice_gly, :integer
    add_column :chat_items, :ratio_glucide, :integer
  end
end
