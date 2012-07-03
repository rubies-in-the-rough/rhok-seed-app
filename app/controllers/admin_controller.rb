class AdminController < ApplicationController

  before_filter :authenticate_user!
  # TODO: we need another filter to make sure the user is an admin!


  def index
    @locked_users = User.where("locked_at IS NOT NULL") || []
    
    #TODO: actually get pending seeds
    @pending_seeds = []
  end

  def unlock_user

    #is this how you'd usually find the user?
    @user_to_unlock = User.find_by_email(params[:email])

    if @user_to_unlock
      @user_to_unlock.unlock_access!

      flash[:notice] = "User #{params[:email]} has been unlocked"
    end

    #render or redirect_to?
    redirect_to :action => "index"
  end
end
