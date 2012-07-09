class Admin::AdminController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin!

  def authenticate_admin!
    unless current_user.admin
      redirect_to root_path, alert: "Only admins can perform that action." and return false
    end
  end

  def index
    #stub
  end
end
