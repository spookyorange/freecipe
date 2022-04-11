class ApplicationController < ActionController::Base
  before_action :authenticate_profile
  def authenticate_profile
    if current_user && current_user.profile.nil?
      redirect_to new_profile_path
    end
  end
end
