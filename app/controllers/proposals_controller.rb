class ProposalsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /listings/:listing_id/proposals
  # GET /listings/:listing_id/proposals.json
  def index
    @proposals = listing.proposals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proposals }
    end
  end

  # GET /listings/:listing_id/proposals/1
  # GET /listings/:listing_id/proposals/1.json
  def show
    @proposal = listing.proposals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /listings/:listing_id/proposals/new
  # GET /listings/:listing_id/proposals/new.json
  def new
    @proposal = listing.proposals.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /listings/:listing_id/proposals/1/edit
  def edit
    @proposal = listing.proposals.find(params[:id])
  end

  # POST /listings/:listing_id/proposals
  # POST /listings/:listing_id/proposals.json
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

  # PUT /listings/:listing_id/proposals/1
  # PUT /listings/:listing_id/proposals/1.json
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

  # DELETE /listings/:listing_id/proposals/1
  # DELETE /listings/:listing_id/proposals/1.json
  def destroy
    @proposal = listing.proposals.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to listing_proposals_url(@listing) }
      format.json { head :no_content }
    end
  end

  def listing
    @listing = Listing.find(params[:listing_id])
  end
end
