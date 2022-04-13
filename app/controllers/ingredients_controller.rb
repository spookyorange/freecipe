class IngredientsController < ApplicationController

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient.recipe = @recipe

    if !user_signed_in? || current_user.profile.nil? ||
       @recipe.profile != current_user.profile
      redirect_to @recipe
    else
      if @ingredient.save
        flash[:notice] = 'Ingredient saved successfully'
        redirect_to @recipe
      else
        flash[:alert] = 'Something went wrong'
        redirect_to @recipe
      end
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @recipe = @ingredient.recipe

    if @ingredient.update(ingredient_params)
      redirect_to @recipe
    else
      render @recipe
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @recipe = @ingredient.recipe

    @ingredient.destroy
    redirect_to @recipe

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end

end
