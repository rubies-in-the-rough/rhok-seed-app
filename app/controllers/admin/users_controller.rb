class Admin::UsersController < Admin::AdminController
  def show_locked
    @locked_users = User.locked 
  end

  def unlock
    @user_to_unlock = User.find(params[:id])

    if @user_to_unlock
      @user_to_unlock.unlock_access!

      # TODO: the interpolation here isn't working
      flash[:notice] = "User #{@user_to_unlock.email} has been unlocked"
    end

    redirect_to admin_users_show_locked_path
  end
end
