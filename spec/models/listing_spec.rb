require 'spec_helper'

describe Listing do


  before(:all) do
    @listing = FactoryGirl.create(:listing)
  end

  describe "attributes" do
    it "#description" do
      @listing.should respond_to(:description)
    end
    it "#lister" do
      @listing.should respond_to(:lister)
    end
    it "#strain" do
      @listing.should respond_to(:strain)
    end   
    it "#seed_quantity" do
      @listing.should respond_to(:seed_quantity)
    end
  end

  describe "relationships" do
    it "has many proposals" do
      @listing.should respond_to(:proposals)
      @listing.proposals.should be_a(Array)
    end
    it "has many proposal users" do
      @listing.should respond_to(:proposal_users)
      @listing.proposal_users.should be_a(Array)
    end
    it "has one accepted proposal" do
      @listing.should respond_to(:accepted_proposal)
      @listing.accepted_proposal = FactoryGirl.create(:proposal)
      @listing.accepted_proposal.should be_a(Proposal)
    end
  end
end
