require 'spec_helper'

describe "manufacturers/show" do
  let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

  before(:each) do
    assign(:manufacturer, manufacturer)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show the manufacturer name" do
    rendered.should have_content(manufacturer.name)
  end
end
