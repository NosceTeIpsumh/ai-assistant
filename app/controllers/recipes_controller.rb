class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :destroy]
  before_action :authorize_destroy, only: [:destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save!
      redirect_to recipes_path
    else
      render :new, :unprocessable_entity
    end
  end

  def destroy
    if @recipe.destroy
      flash[:notice] = "La recette a été supprimée avec succés"
      redirect_to recipes_path, status: :see_other
    else
      flash[:alert] = "La recette n'a pas pu être supprimée!"
      redirect_to recipe_path(@recipe), status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :difficulty, :indice_gly, :user_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def authorize_destroy
    unless @recipe.user == current_user
      flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action"
      redirect_to root_path
      return
    end
  end
end
