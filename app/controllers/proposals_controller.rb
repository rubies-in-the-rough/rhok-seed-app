class ProposalsController < ApplicationController

  #allow unlogged in users to index and show
  before_filter :authenticate_user!, :except => [:index, :show]

  # index all the proposals for a listing
  def index
    @proposals = listing.proposals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proposals }
    end
  end

  # show a proposal
  def show
    @proposal = listing.proposals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal }
    end
  end

  # create a new proposal so that we may generate a form for it
  def new
    @proposal = listing.proposals.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposal }
    end
  end

  # find a proposal so that we may generate a form for it
  def edit
    @proposal = listing.proposals.find(params[:id])
  end

  # create a new listing from post params
  def create
    @proposal = listing.proposals.build(params[:proposal])

    #prolly a better way to do this
    @proposal.proposer_id = current_user.id

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to listing_proposal_url(@listing, @proposal), notice: 'Proposal was successfully created.' }
        format.json { render json: @proposal, status: :created, location: @proposal }
      else
        format.html { render action: "new" }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  #update a proposal with post params
  def update
    @proposal = listing.proposals.find(params[:id])

    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # destroy a proposal by id
  def destroy
    @proposal = listing.proposals.find(params[:id])


    respond_to do |format|
      if @proposal.id == @proposal.listing.accepted_proposal_id
        format.html { redirect_to listing_proposals_url(@listing), error: "You can't remove an accepted proposal." }
        format.json { head :no_content }
      else
        @proposal.destroy
        format.html { redirect_to listing_proposals_url(@listing) }
        format.json { head :no_content }
      end
    end
  end

  #return the listing associated with proposal
  def listing
    @listing = Listing.find(params[:listing_id])
  end

end
