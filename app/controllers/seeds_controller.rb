class SeedsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @seeds = Seed.accepted
  end

  def new
    @seed = Seed.new
  end

  def create
    @seed = Seed.new(params[:seed])
    @seed.accepted = false #always set this to false

    if @seed.save
      flash[:notice] = "#{@seed.common_name} has been submitted for approval"
      redirect_to :action => "index"
    else
      #erm, dunno if this allows for validations to be shown
      #what i want to have happen here is the new view is again rendered with
      #the new seed form filled as previously submitted, but with validation
      #failure messages (maybe flash them).
      flash.now[:error] = "Something is wrong with that seed"
      render :action => "new"
    end
  end

  def show
    @seed = Seed.find(params[:id])

    unless @seed.accepted
      flash[:notice] = "That seed is still subject to administrator approval"
      redirect_to :action => "index"
    end

    @listings = Listing.find(:all, :conditions => {:seed_id => @seed})
  end

  def search
      @query = "%#{params[:query]}%" #escape that shit from sql injections
      @seeds_of_common_name = Seed.find_all_like_common_name(@query)
      @seeds_of_scientific_name = Seed.find_all_like_scientific_name(@query)
      @seeds_of_hardiness_zone = Seed.find_all_in_hardiness_zone(@query)
  end
end
