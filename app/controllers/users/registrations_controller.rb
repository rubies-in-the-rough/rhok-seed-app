class Users::RegistrationsController < Devise::RegistrationsController

  #GET /users/sign_up
  # Render the registration form
  def new
    self.resource = User.new_with_session({}, session)
  end

  #POST /users/sign_up
  # Create a new user entry and log the user in
  def create
    user = build_resource

    if user.save
      set_flash_message :notice, :signed_up
      sign_in('user', user)
      respond_with user, :location => after_sign_up_path_for(user)
    else
      clean_up_passwords user
      respond_with user
    end
  end

  # GET /users/edit
  # Render the account edit form
  def edit
    render :edit
  end

  # PUT /users
  # Update the user entry with incoming attributes
  def update
    user = self.resource = User.to_adapter.get!(send(:"current_user").to_key)

    if user.update_with_password(resource_params)
      set_flash_message :notice, :updated
      sign_in resource_name, user, :bypass => true
      respond_with user, :location => after_update_path_for(user)
    else
      clean_up_passwords user
      respond_with user
    end
  end

end
