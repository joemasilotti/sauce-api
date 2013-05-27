require 'spec_helper'

describe "sauces/edit" do
  let!(:sauce) { FactoryGirl.create(:sauce) }

  before(:each) do
    assign(:sauce, sauce)
    render
  end

  it "shows an editable field for sauce name" do
    rendered.should have_selector("input[name='sauce[name]']")
  end

  it "shows an editable field for sauce manufacturer" do
    rendered.should have_selector("input[name='sauce[manufacturer]']")
  end
end
