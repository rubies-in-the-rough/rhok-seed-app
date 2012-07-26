require "spec_helper"

describe ProposalsController do
  describe "routing" do

    it "routes to #index" do
      get("/listings/1/proposals").should route_to("proposals#index")
    end

    it "routes to #new" do
      get("/listings/1/proposals/new").should route_to("proposals#new")
    end

    it "routes to #show" do
      get("/listings/1/proposals/1").should route_to("proposals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/listings/1/proposals/1/edit").should route_to("proposals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/listings/1/proposals").should route_to("proposals#create")
    end

    it "routes to #update" do
      put("/listings/1/proposals/1").should route_to("proposals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/listings/1/proposals/1").should route_to("proposals#destroy", :id => "1")
    end

  end
end
