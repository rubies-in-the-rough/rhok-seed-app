class AdminController < ApplicationController

  before_filter :authenticate_user!

  def index
    @locked_users = User.where("locked_at IS NOT NULL")
  end

  def unlock_user

  end
end
