require 'spec_helper'

describe "flavors/show" do
  let(:flavor) { FactoryGirl.build(:flavor) }

  before(:each) do
    assign(:flavor, flavor)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show the flavor name" do
    rendered.should have_content(flavor.name)
  end
end
