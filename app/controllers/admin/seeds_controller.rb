class Admin::SeedsController < Admin::AdminController
  # only index the seeds pending approval
  def index
    #use dat scope
    @pending_seeds = Seed.unaccepted
  end

  # accept a seed
  def accept
    @seed_to_accept = Seed.find(params[:id])

    #set accepted to true, which means a seed will now be in the seed#index
    @seed_to_accept.update_attribute(:accepted, true)

    #In the flash, put a link to the seed/show view that you just created
    flash[:notice] = "Accepted seed <a href=\"#{url_for(@seed_to_accept)}\">#{@seed_to_accept.common_name}</a>.".html_safe
    #back to index if admin wants to keep accepting/rejecting
    redirect_to admin_seeds_path
  end

  # reject a seed
  def destroy
    @seed_to_reject = Seed.find(params[:id])

    #no need to keep a seed around that we don't like.
    #get rid of it from the db
    @seed_to_reject.destroy

    flash[:notice] = "Rejected seed #{@seed_to_reject.common_name}."
    #back to index if admin wants to keep accepting/rejecting
    redirect_to admin_seeds_path
  end

end
