require 'spec_helper'

describe "proposals/edit" do
  before(:each) do
    @proposal = assign(:proposal, stub_model(Proposal,
      :listing_id => 1,
      :seed_id => 1,
      :seed_quantity => 1,
      :strain => "MyString"
    ))
  end

  it "renders the edit proposal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proposals_path(@proposal), :method => "post" do
      assert_select "input#proposal_listing_id", :name => "proposal[listing_id]"
      assert_select "input#proposal_seed_id", :name => "proposal[seed_id]"
      assert_select "input#proposal_seed_quantity", :name => "proposal[seed_quantity]"
      assert_select "input#proposal_strain", :name => "proposal[strain]"
    end
  end
end
