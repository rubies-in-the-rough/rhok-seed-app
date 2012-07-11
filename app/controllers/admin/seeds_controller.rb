class Admin::SeedsController < Admin::AdminController
  def index
    @pending_seeds = Seed.unaccepted
  end

  # accept a seed
  def accept
    @seed_to_accept = Seed.find(params[:id])

    @seed_to_accept.update_attribute(:accepted, true)

    #flash[:notice] = "Accepted seed #{@seed_to_accept.common_name}."
    flash[:notice] = "Accepted seed <a href=\"#{url_for(@seed_to_accept)}\">#{@seed_to_accept.common_name}</a>.".html_safe
    #redirect_to seed_path(params[:id]) #back to seed (not admin)
    redirect_to admin_seeds_path #back to index
  end

  # reject a seed
  def destroy
    @seed_to_reject = Seed.find(params[:id])

    @seed_to_reject.destroy

    flash[:notice] = "Rejected seed #{@seed_to_reject.common_name}."
    redirect_to admin_seeds_path #back to index
  end

  def edit
    @seed = Seed.find(params[:id])
  end

  def show
    @seed = Seed.find(params[:id])
  end

  def update
    @seed = Seed.find(params[:id])
    if @seed.update_attributes(params[:seed])
      redirect_to seed_path(params[:id])
    else
      #TODO: show validation errors
      flash.now[:error] = "Something is wrong with that seed"
      render :action => "edit"
    end
  end
end