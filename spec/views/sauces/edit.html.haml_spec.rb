require 'spec_helper'

describe "sauces/edit" do
  let!(:flavors) { [ FactoryGirl.create(:flavor, :name => "Associated Flavor"), FactoryGirl.create(:flavor) ] }
  let!(:sauce) { FactoryGirl.build(:sauce) }

  before(:each) do
    sauce.flavors = [ flavors[0] ]
    assign(:sauce, sauce)
    assign(:flavors, flavors)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "shows an editable text field for sauce name" do
    page.should have_selector("input[type='text'][name='sauce[name]']")
  end

  it "shows a select field for sauce manufacturer" do
    page.should have_selector("select[name='sauce[manufacturer_id]']")
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
