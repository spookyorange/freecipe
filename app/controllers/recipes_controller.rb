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
  end

  def new
    @recipe = Recipe.new
  end

  def create

  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update

  end

  def destroy
    @recipe = Recipe.find(params[:id])
  end

end
