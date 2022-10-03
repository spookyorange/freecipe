class IngredientsController < ApplicationController
  before_action :authenticate_owner

  def authenticate_owner
    @recipe = Recipe.find(params[:recipe_id])
    if !user_signed_in? || !current_user.profile || !(current_user.profile == @recipe.profile)
      redirect_to @recipe
    end
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients.sort_by(&:id)
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
  end

  def create
    # TODO: FOR VIEW Implement reset form after successful creation
    # TODO: FOR VIEW Show errors
    # TODO: Add turbo stream file to add new ingredients to preview page / index page of the ingredients
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
      flash.now[:success] = 'Ingredient updated successfully'
    else
      flash.now[:alert] = 'Something went wrong'
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy

    flash[:notice] = 'Ingredient successfully deleted'
    redirect_to recipe_ingredients_path(@recipe)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end

end
