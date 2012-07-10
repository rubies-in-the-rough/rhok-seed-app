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

    @listings = @seed.listings
  end
end
