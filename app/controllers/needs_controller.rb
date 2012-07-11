class NeedsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @needed_seeds = current_user.needed_seeds
  end

  def create
    @seed = Seed.find(params[:need][:seed_id])
    current_user.need!(@seed)
    flash[:notice] = "You now need #{@seed.common_name}."
    redirect_to needs_path
  end

  def destroy
    @seed = Need.find(params[:id]).seed
    current_user.unneed!(@seed)
    flash[:notice] = "You no longer need #{@seed.common_name}."
    redirect_to needs_path
  end
end
