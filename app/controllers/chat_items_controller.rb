class ChatItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @chat_item = ChatItem.new
    @items = current_user.items
  end
  def create
    @chat = Chat.create!(user_id: current_user.id)
    # unless @chat.save
    #   flash[:alert] = "Impossible de démarrer le chat"
    # end
    @retrieved_items = params[:chat_item][:item_id] # ["", 1, 2, 3]
    @cleaned_retrieved_items = @retrieved_items.reject(&:empty?) # Enlève le empty à l'index 0 -> [1, 2, 3]
    @selected_items = @cleaned_retrieved_items.map { |selected_item| Item.where(id: selected_item).uniq } # On comparait les chiffres dans les array avec les ID des Items
    # .flatten
    # On passe de:
    # [[Instance], [Instance], [Instance]]
    # à
    # [Instance, Instance, Instance]
    @selected_items.flatten.each do |original_item|
      @chat.chat_items.create!(
        item_id: original_item.id,
        name: original_item.name,
        brand: original_item.brand,
        indice_gly: original_item.indice_gly,
        ratio_glucide: original_item.ratio_glucide,
        category: original_item.category
      )
    end
    redirect_to chat_path(@chat)
  end
end
