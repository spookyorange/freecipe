class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: :show
  skip_before_action :authenticate_profile, except: [:edit, :update]
  before_action :authenticate_owner, only: [:edit, :update]

  def authenticate_owner
    if current_user.profile != Profile.find(params[:id])
      redirect_to current_user.profile
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:username)
  end
end
