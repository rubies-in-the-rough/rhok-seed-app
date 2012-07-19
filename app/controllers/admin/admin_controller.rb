class Admin::AdminController < ApplicationController

  before_filter :authenticate_user!

  #Only admins can use the controllers that subclass this AdminController
  before_filter :authenticate_admin!

  def authenticate_admin!
    unless current_user.admin
      #direct to homepage with error flash
      redirect_to root_path, alert: "Only admins can perform that action." and return false
    end
  end
end
