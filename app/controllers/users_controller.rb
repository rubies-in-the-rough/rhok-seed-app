class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  # Render a list of all users
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  # Render a specific user's profile
  def show
    @user = User.find(params[:id])
    @listings = Listing.find(:all, :conditions => {:lister_id => @user.id})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users/search
  # Render results for a user search by email address
  def search
    @query = "%#{params[:query]}%" #escape that shit from sql injections
    @users_of_email = User.find_all_like_email(@query)
  end
end
