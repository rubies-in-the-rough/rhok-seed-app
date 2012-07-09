class Admin::SeedController < Admin::AdminController
  def index
    #TODO: actually get pending seeds
    @pending_seeds = []
  end

  def approve
    #TODO
    redirect_to :action => "index"
  end

  def deny
    #TODO
    redirect_to :action => "index"
  end
end
