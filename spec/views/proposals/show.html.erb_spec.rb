require 'spec_helper'

describe "proposals/show" do
  before(:each) do
    @proposal = assign(:proposal, stub_model(Proposal,
      :listing_id => 1,
      :seed_id => 2,
      :seed_quantity => 3,
      :strain => "Strain"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Strain/)
  end
end
