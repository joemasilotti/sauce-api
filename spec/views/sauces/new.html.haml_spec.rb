require 'spec_helper'

describe "sauces/new" do
  let!(:sauce) { FactoryGirl.create(:sauce) }

  before(:each) do
    assign(:sauce, sauce)
    render
  end

  it "shows an editable text field for sauce name" do
    rendered.should have_selector("input[type='text'][name='sauce[name]']")
  end

  it "shows a select field for sauce manufacturer" do
    rendered.should have_selector("select[name='sauce[manufacturer_id]']")
  end

  it "shows a submit button" do
    rendered.should have_selector("input[type='submit']")
  end
end
