class ListingsController < ApplicationController

  #allow unlogged in users to index and show
  before_filter :authenticate_user!, :except => [:index, :show]

  #index only listings that are open
  #users shouldn't be shown listings that are closed (already accepted proposal)
  def index
    @listings = Listing.open

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end
  end

  #show a listing
  def show
    @listing = Listing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listing }
    end
  end

  # create a new listing so that we may generate a form for it
  def new
    @listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
  end

  # find a current listing so that we may generate a form for it
  def edit
    @listing = Listing.find(params[:id])
  end

  # use post parameters to make a new listing
  def create
    @listing = Listing.new(params[:listing])
    @listing.lister = current_user


    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render json: @listing, status: :created, location: @listing }
      else
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  #find a listing by id an update it with post params
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # destroy a listing (found by id) from the database
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  # perform a search on listings from a user's search query
  def search
    @query = "%#{params[:query]}%" #escape that shit from sql injections
    @listings_of_strain = Listing.open.find_all_like_strain(@query) #only search on open listings
  end

  # attach a proposal to a listing as the accepted_proposal
  def accept_proposal
    listing = Listing.find(params[:id])
    listing.update_attributes!(accepted_proposal_id: params[:proposal_id])
    redirect_to listing
  end

end
