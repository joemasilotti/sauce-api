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

  it "should show a link to edit the flavor" do
    rendered.should have_link('Edit', href: edit_flavor_url(flavor))
  end

  it "shows a delete button" do
    rendered.should have_selector("input[type='submit'][value='Delete']")
  end
end
