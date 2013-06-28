require 'spec_helper'

describe "manufacturers/new" do
  let!(:manufacturer) { mock_model(Manufacturer) }

  before(:each) do
    assign(:manufacturer, manufacturer)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "shows an editable text field for manufacturer name" do
    rendered.should have_selector("input[type='text'][name='manufacturer[name]']")
  end

  it "shows a submit button" do
    rendered.should have_selector("input[type='submit']")
  end
end
