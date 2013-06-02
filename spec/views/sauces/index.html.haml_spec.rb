require 'spec_helper'

describe "sauces/index" do
  before do
    sauce1 = FactoryGirl.create(:sauce)
    sauce2 = FactoryGirl.create(:sauce)
    @sauces = [sauce1, sauce2]
    render
  end

  it "should show each sauce's properties" do
    @sauces.each do |sauce|
      rendered.should have_content(sauce.name)
      rendered.should have_content(sauce.manufacturer)
    end
  end

  it "should show a link to display, update, and delete each sauce" do
    @sauces.each do |sauce|
      rendered.should have_link('Show', href: sauce_path(sauce))
      rendered.should have_link('Edit', href: edit_sauce_path(sauce))
      rendered.should have_selector("input[type='submit'][value='Delete']")
    end
  end

  it "should show a link to add a new sauce" do
    rendered.should have_link('Add', href: new_sauce_path)
  end
end
