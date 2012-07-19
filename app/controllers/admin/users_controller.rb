class Admin::UsersController < Admin::AdminController
  #only show the locked users
  def show_locked
    @locked_users = User.locked 
  end

  #perform an unlock
  def unlock
    @user_to_unlock = User.find(params[:id])

    if @user_to_unlock
      #use model method to take care of the details of this
      @user_to_unlock.unlock_access!

      flash[:notice] = "User #{@user_to_unlock.email} has been unlocked"
    end

    redirect_to admin_users_show_locked_path
  end
end
