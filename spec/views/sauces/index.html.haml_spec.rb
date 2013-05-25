require 'spec_helper'

describe "sauces/index" do
  it "should show a link to display each sauce" do
    sauce = FactoryGirl.create(:sauce)
    assign(:sauces, [sauce])
    render
    rendered.should have_link('Show', href: sauce_url(sauce))
  end
end
