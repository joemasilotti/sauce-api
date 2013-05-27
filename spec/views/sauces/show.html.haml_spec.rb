require 'spec_helper'

describe "sauces/show" do
  let!(:sauce) { FactoryGirl.create(:sauce) }

  before(:each) do
    assign(:sauce, sauce)
    render
  end

  it "should show the sauce name" do
    rendered.should have_content(sauce.name)
  end

  it "should show the sauce manufacturer" do
    rendered.should have_content(sauce.manufacturer)
  end

  it "should show a link to edit the sauce" do
    rendered.should have_link('Edit', href: edit_sauce_url(sauce))
  end
end
