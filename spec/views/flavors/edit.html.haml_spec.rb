require 'spec_helper'

describe "flavors/edit" do
  let!(:flavor) { FactoryGirl.create(:flavor) }

  before(:each) do
    assign(:flavor, flavor)
    render
  end

  it "shows an editable field for flavor name" do
    rendered.should have_selector("input[name='flavor[name]']")
  end

  it "shows a delete button" do
    rendered.should have_selector("input[type='submit'][value='Delete']")
  end
end
