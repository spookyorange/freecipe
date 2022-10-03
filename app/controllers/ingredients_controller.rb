class IngredientsController < ApplicationController
  before_action :authenticate_owner

  def authenticate_owner
    if !user_signed_in? || current_user.profile.nil? ||
      Recipe.find(params[:recipe_id]).profile != current_user.profile
      redirect_to Recipe.find(params[:recipe_id])
      flash[:alert] = 'This is not your Recipe!'
    end
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
  end

  def create
    # TODO: FOR VIEW Implement reset form after successful creation
    # TODO: FOR VIEW Show errors
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      flash.now[:success] = 'Ingredient created successfully'
    else
      flash.now[:alert] = 'Something went wrong'
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    if @ingredient.update(ingredient_params)
      flash[:success] = 'Ingredient updated successfully'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    @ingredient.destroy
    flash[:notice] = 'ingredient deleted successfully'
    redirect_to @recipe, status: 303
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end

end
