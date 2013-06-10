require 'spec_helper'

describe "layouts/application" do
  before(:each) do
    render
  end

  it "should set the title of the page to Sauce API" do
    page.should have_title('Sauce API')
  end
end
