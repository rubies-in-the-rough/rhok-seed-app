require 'spec_helper'

describe Listing do


  before(:all) do
    @listing = FactoryGirl.create(:listing)
  end

  after(:all) do
    @listing.destroy
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
    end
  end

  describe "instance methods" do
    it "#open? - checks if the listing has been claimed" do
      @listing.should respond_to(:open?)
      @listing.open?.should be_true
    end
  end

  describe "class methods" do
    it "#find_all_like_strain" do
      listings = Listing.find_all_like_strain(@listing.strain)
      listings.should_not be_nil
      listings.first.id.should be(@listing.id)
    end
    it "#open find all open/unclaimed listings" do
      listings = Listing.open
      listings.should_not be_nil
      listings.first.id.should be(@listing.id)
    end
    it "#closed find all closed/claimed listings" do
      listings = Listing.closed
      listings.should_not be_nil
      listings.should be_empty
    end
  end

end
