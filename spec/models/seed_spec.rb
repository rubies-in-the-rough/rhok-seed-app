require 'spec_helper'

describe Seed do


  before(:all) do
    @seed = FactoryGirl.create(:seed)
  end

  after(:all) do
    @seed.destroy
  end

  describe "attributes" do
    it "#accepted" do
      @seed.should respond_to(:accepted)
    end
    it "#common_name" do
      @seed.should respond_to(:common_name)
    end
    it "#hardiness_zone" do
      @seed.should respond_to(:hardiness_zone)
    end   
    it "#scientific_name" do
      @seed.should respond_to(:scientific_name)
    end
    it "#additional_info" do
      @seed.should respond_to(:additional_info)
    end

  end

  describe "relationships" do
    it "has many proposals" do
      @seed.should respond_to(:proposals)
      @seed.proposals.should be_a(Array)
    end
    it "has many listings" do
      @seed.should respond_to(:listings)
      @seed.listings.should be_a(Array)
    end
  end

  describe "class methods" do
    it "#find_all_like_common_name" do
      seeds = Seed.find_all_like_common_name(@seed.common_name)
      seeds.should_not be_nil
      seeds.last.id.should be(@seed.id)
    end
    it "#find_all_like_scientific_name" do
      seeds = Seed.find_all_like_scientific_name(@seed.scientific_name)
      seeds.should_not be_nil
      seeds.last.id.should be(@seed.id)
    end
    it "#find_all_in_hardiness_zone" do
      seeds = Seed.find_all_in_hardiness_zone(@seed.hardiness_zone)
      seeds.should_not be_nil
    end
    it "#accepted - finds all accepted seeds" do
      seeds = Seed.accepted
      seeds.should_not be_nil
      seeds.last.id.should be(@seed.id)
    end
    it "#unaccepted - finds all pending" do
      seeds = Seed.unaccepted
      seeds.should_not be_nil
      seeds.should be_empty
    end
  end

end

