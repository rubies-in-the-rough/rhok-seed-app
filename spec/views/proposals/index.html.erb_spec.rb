require 'spec_helper'

describe "proposals/index" do
  before(:each) do
    assign(:proposals, [
      stub_model(Proposal,
        :listing_id => 1,
        :seed_id => 2,
        :seed_quantity => 3,
        :strain => "Strain"
      ),
      stub_model(Proposal,
        :listing_id => 1,
        :seed_id => 2,
        :seed_quantity => 3,
        :strain => "Strain"
      )
    ])
  end

  it "renders a list of proposals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Strain".to_s, :count => 2
  end
end
