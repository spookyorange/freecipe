class StepsController < ApplicationController
  before_action :authenticate_owner

  def authenticate_owner
    @recipe = Recipe.find(params[:recipe_id])
    if !user_signed_in? || !current_user.profile || !(current_user.profile == @recipe.profile)
      redirect_to @recipe
    end
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe

    if @step.save
      flash[:notice] = 'Step successfully saved'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_to @recipe
  end

  def update
    @step = Step.find(params[:id])

    if @step.update(step_params)
      flash[:notice] = 'Step successfully updated'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_to @recipe

  end

  def destroy
    @step = Step.find(params[:id])
    @step.delete

    flash[:notice] = 'Step successfully deleted'
    redirect_to @recipe
  end

  private

  def step_params
    params.require(:step).permit(:title, :description, :time_consumption, :order)
  end
end