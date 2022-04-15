class IngredientsController < ApplicationController
  before_action :authenticate_owner

  def authenticate_owner
    if !user_signed_in? || current_user.profile.nil? ||
      Recipe.find(params[:recipe_id]).profile != current_user.profile
      redirect_to @recipe
      flash[:alert] = 'This is not your Recipe!'
    end
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient.recipe = @recipe

    if @ingredient.save
        flash[:notice] = 'Ingredient saved successfully'
        redirect_to @recipe
    else
      flash[:alert] = 'Something went wrong'
      redirect_to @recipe
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @recipe = @ingredient.recipe

    if @ingredient.update(ingredient_params)
      flash[:notice] = 'Ingredient updated successfully'
      redirect_to @recipe
    else
      flash[:alert] = 'Something went wrong'
      redirect_to @recipe
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @recipe = @ingredient.recipe

    @ingredient.destroy
    flash[:notice] = 'ingredient deleted successfully'
    redirect_to @recipe

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end

end
