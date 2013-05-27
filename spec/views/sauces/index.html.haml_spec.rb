require 'spec_helper'

describe "sauces/index" do
  it "should show a link to display each sauce" do
    sauce = FactoryGirl.create(:sauce)
    assign(:sauces, [sauce])
    render
    rendered.should have_link('Show', href: sauce_url(sauce))
    rendered.should have_link('Edit', href: edit_sauce_url(sauce))
    rendered.should have_link('Add', href: new_sauce_url)
  end
end
