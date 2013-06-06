require 'spec_helper'

describe "flavors/new" do
  let!(:flavor) { FactoryGirl.create(:flavor) }

  before(:each) do
    assign(:flavor, flavor)
    render
  end

  it "shows an editable text field for flavor name" do
    rendered.should have_selector("input[type='text'][name='flavor[name]']")
  end

  it "shows a submit button" do
    rendered.should have_selector("input[type='submit']")
  end
end
