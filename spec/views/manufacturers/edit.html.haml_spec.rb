require 'spec_helper'

describe "manufacturers/edit" do
  let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

  before(:each) do
    assign(:manufacturer, manufacturer)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "shows an editable text field for manufacturer name" do
    page.should have_selector("input[type='text'][name='manufacturer[name]']")
  end
end
