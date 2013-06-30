require 'spec_helper'

describe "sauces/show" do
  let!(:sauce) { FactoryGirl.build(:sauce) }

  before(:each) do
    assign(:sauce, sauce)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show the sauce name" do
    rendered.should have_content(sauce.name)
  end

  it "should show the sauce manufacturer name" do
    rendered.should have_content(sauce.manufacturer.name)
  end
end
