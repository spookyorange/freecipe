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

  end

  def create

  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update

  end

  def show
    @profile = Profile.find(params[:id])
  end

end
