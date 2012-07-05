class SessionsController < Devise::SessionsController

  # GET /users/sign_in
  def new
    user = User.new
    respond_with(user, serialize_options(user))
  end

  # POST /users/sign_in
  def create
    user = warden.authenticate!(:scope => "user", :recall => "sessions#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in("user", user)
    respond_with user, :location => after_sign_in_path_for(user)
  end

  # DELETE /users/sign_out
  def destroy
    redirect_path = after_sign_out_path_for("user")
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out("user"))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?
    super
  end

end