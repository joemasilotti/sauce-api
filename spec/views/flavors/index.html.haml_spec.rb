require 'spec_helper'

describe "flavors/index" do
  before do
    flavor1 = FactoryGirl.create(:flavor)
    flavor2 = FactoryGirl.create(:flavor)
    @flavors = [flavor1, flavor2]
    render
  end

  it "should show each flavor's properties" do
    @flavors.each do |flavor|
      rendered.should have_content(flavor.name)
    end
  end

  it "should show a link to display, update, and delete each flavor" do
    @flavors.each do |flavor|
      rendered.should have_link('Show', href: flavor_url(flavor))
      rendered.should have_link('Edit', href: edit_flavor_url(flavor))
      rendered.should have_selector("input[type='submit'][value='Delete']")
    end
  end

  it "should show a link to add a new flavor" do
    rendered.should have_link('Add', href: new_flavor_url)
  end
end
