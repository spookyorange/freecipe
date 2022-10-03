class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_owner, only: [:edit, :update, :destroy]

  def authenticate_owner
    if !user_signed_in? || current_user.profile.nil? || current_user.profile.recipes.exclude?(Recipe.find(params[:id]))
      redirect_to recipe_url(params[:id])
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @steps = @recipe.steps.sort_by(&:order)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.profile = current_user.profile

    if @recipe.save
      flash[:notice] = 'You have created a Recipe'
      redirect_to @recipe
    else
      flash.now[:error] = "Recipe couldn't be created"
      respond_to do |format|
        format.turbo_stream
        format.html { render :new }
      end
    end
  end

  def edit
    # TODO: Implement Ingredient and Step preview
    # TODO: Make Implement and Step preview turbo powered
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash.now[:success] = 'Recipe successfully updated!'
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:error] = "Recipe couldn't be updated"
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :about)
  end

end
