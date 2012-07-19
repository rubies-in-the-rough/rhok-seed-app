class NeedsController < ApplicationController
  before_filter :authenticate_user!

  #index all my needs
  def index
    @needed_seeds = current_user.needed_seeds
  end

  #need a new seed, show a flash, and redirect back to the needs/index view
  def create
    @seed = Seed.find(params[:need][:seed_id])
    current_user.need!(@seed)
    flash[:notice] = "You now need #{@seed.common_name}."
    redirect_to needs_path
  end

  #no longer need a seed by destroying the need record
  def destroy
    @seed = Need.find(params[:id]).seed
    current_user.unneed!(@seed)
    flash[:notice] = "You no longer need #{@seed.common_name}."
    redirect_to needs_path
  end
end
