class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!

  def authenticate_admin!
    unless current_user.admin
      redirect_to new_user_session_url, alert: "You need to sign in or sign up before continuing." and return false
    end
  end

  def index
    @locked_users = User.locked 
    
    #TODO: actually get pending seeds
    @pending_seeds = []
  end

  def unlock_user

    #is this how you'd usually find the user?
    @user_to_unlock = User.find(params[:id])

    if @user_to_unlock
      @user_to_unlock.unlock_access!

      flash[:notice] = "User #{params[:email]} has been unlocked"
    end

    #render or redirect_to?
    redirect_to :action => "index"
  end
end
