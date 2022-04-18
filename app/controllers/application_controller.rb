class ApplicationController < ActionController::Base
  before_action :authenticate_profile, except: :destroy
  def authenticate_profile
    if user_signed_in? && current_user.profile.nil?
      redirect_to new_profile_path
    end
  end
end
