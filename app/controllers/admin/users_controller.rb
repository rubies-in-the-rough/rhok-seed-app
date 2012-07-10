class Admin::UsersController < Admin::AdminController
  def show_locked
    @locked_users = User.locked 
  end

  def unlock
    @user_to_unlock = User.find(params[:id])

    if @user_to_unlock
      @user_to_unlock.unlock_access!

      # TODO: the interpolation here isn't working
      flash[:notice] = "User #{params[:email]} has been unlocked"
    end

    redirect_to :action => "show_locked"
  end

  def show_listings
    # TODO: make this functional
    # ensure the with_listings scope works
    # modify views/admin/user/show_listings.html.erb to display relevant data
    #@users_with_listings = User.with_listings
    @users_with_listings = []
  end
end
