class ChatItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @chat_item = ChatItem.new
    @items = current_user.items
  end

  def create
    raise
    @chat = Chat.new
    @chat.user = current_user
    unless @chat.save
      flash[:alert] = "Impossible de démarrer le chat"
    end

    choosen_item_ids = params
    @selected_items = Item.find(choosen_item_ids)

    @selected_items.each do |original_item|
      chat_item = @chat.chat_items.create!(
        item_id: original_item.id,
        name: original_item.name,
        brand: original_item.brand,
        indice_gly: original_item.indice_gly,
        ratio_glucide: original_item.ratio_glucide,
        category: original_item.category,
      )
    end

    redirect_to chat_path
  end

end
