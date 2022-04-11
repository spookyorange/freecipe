class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action :authenticate_profile, only: [:new, :create]
  def new

  end

  def create

  end
end
