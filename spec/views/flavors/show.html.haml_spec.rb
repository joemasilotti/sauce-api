require 'spec_helper'

describe "flavors/show" do
  let!(:flavor) { FactoryGirl.create(:flavor) }

  before(:each) do
    assign(:flavor, flavor)
    render
  end

  it "should show the flavor name" do
    rendered.should have_content(flavor.name)
  end
end
