class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_chat, only: [:show, :destroy]
  before_action :authorize_destroy, only: [:destroy]

  def index
    @chats = current_user.chats
  end

  def show
    # Faut-il adapter find_chat au current-user.chats.find(params[:id])
    @message = Message.new
  end

  def destroy
    if @chat.destroy
      flash[:notice] = "Le chat a été supprimé avec succés"
      redirect_to root_path, status: :see_other
    else
      flash[:alert] = "Le chat n'a pas pu être supprimé!"
      redirect_to chat_path(@chat), status: :unprocessable_entity
    end
    redirect_to root_path, status: :see_other
  end

  private

  def find_chat
    @chat = Chat.find(params[:id]) # current_user.chats.find(params[:id])
  end

  def authorize_destroy
    unless @chat.user == current_user
      flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action"
      redirect_to root_path
      return
    end
  end
end
