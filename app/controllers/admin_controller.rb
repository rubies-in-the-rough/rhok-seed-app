class AdminController < ApplicationController

  before_filter :authenticate_user!
  # TODO: we need another filter to make sure the user is an admin!

  def index
    @locked_users = User.where("locked_at IS NOT NULL")
  end

  def unlock_user

  end
end
