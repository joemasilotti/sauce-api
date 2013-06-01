require 'spec_helper'

describe "sauces/edit" do
  let!(:flavors) { [ FactoryGirl.create(:flavor, :name => "Associated Flavor"), FactoryGirl.create(:flavor) ] }
  let!(:sauce) { FactoryGirl.create(:sauce) }

  before(:each) do
    sauce.flavors = [ flavors[0] ]
    sauce.save
    assign(:sauce, sauce)
    assign(:flavors, flavors)
    render
  end

  it "shows an editable field for sauce name" do
    page.should have_selector("input[name='sauce[name]']")
  end

  it "shows an editable field for sauce manufacturer" do
    page.should have_selector("input[name='sauce[manufacturer]']")
  end

  it "shows a check box for each flavor" do
    flavors.each do |flavor|
      page.should have_css("#sauce_flavor_ids_#{flavor.id}")
    end
  end

  it "checks flavor boxes that are associated with that sauce" do
    page.find("#sauce_flavor_ids_#{sauce.flavors.first.id}").should be_checked
  end

  it "does not check flavor boxes that are not associated with that sauce" do
    page.find("#sauce_flavor_ids_#{flavors[1].id}").should_not be_checked
  end
end
