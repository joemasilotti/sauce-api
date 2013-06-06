require 'spec_helper'

describe "sauces/show" do
  let!(:sauce) { FactoryGirl.create(:sauce) }
  let!(:associated_flavors) { [ FactoryGirl.create(:flavor, :name => "Sauce 1"), FactoryGirl.create(:flavor, :name => "Sauce 2") ] }
  let!(:not_associated_flavor) { FactoryGirl.create(:flavor, :name => "Sauce 3") }

  before(:each) do
    sauce.flavors = associated_flavors
    sauce.save
    assign(:sauce, sauce)
    render
  end

  it "should show the sauce name" do
    rendered.should have_content(sauce.name)
  end

  it "should show the sauce manufacturer name" do
    rendered.should have_content(sauce.manufacturer.name)
  end

  it "should show each associated flavor" do
    rendered.should have_content(associated_flavors[0].name)
    rendered.should have_content(associated_flavors[1].name)
  end

  it "should not show the non associated flavors" do
    rendered.should_not have_content(not_associated_flavor.name)
  end
end
