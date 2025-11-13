class ItemsController < ApplicationController

  before_action :authenticate_user!


  def index
    @items = current_user.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new # Needed to instantiate the simple_form_for
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to items_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:name, :brand, :category, :indice_gly, :ratio_glucide)
  end

end
