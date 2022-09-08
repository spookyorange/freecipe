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
    @profile.save

    if @profile.errors[:username].none?
      current_user.profile = @profile
      flash[:success] = "Profile has been created!"
      redirect_to root_path
    else
      flash.now[:error] = 'Hmm, something went wrong'
      render turbo_stream: [
        turbo_stream.update("flash", partial: "layouts/flash"),
        turbo_stream.update("profile-errors", partial: "profiles/profile_error",
                            locals: { errors: @profile.errors[:username], attr: "Username" })
      ]
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      flash[:success] = 'Username updated successfully!'
      redirect_to @profile
    else
      flash.now[:error] = 'Hmm, something went wrong'
      respond_to do |format|
        format.turbo_stream
        format.html { render :edit }
      end
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
