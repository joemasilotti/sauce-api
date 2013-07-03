require 'spec_helper'

describe "reviews/new" do
  let(:sauce) { FactoryGirl.create(:sauce) }
  let(:review) {
    FactoryGirl.create(:review,
      flavors: [
        FactoryGirl.create(:flavor),
        FactoryGirl.create(:flavor)
  ])}

  before(:each) do
    assign(:sauce, sauce)
    assign(:review, review)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "shows an radio button for rating" do
    rendered.should have_selector("input[type='radio'][name='review[rating]']")
  end

  it "shows checkboxes for flavors" do
    rendered.should have_selector("input[type='checkbox'][name='review[flavor_ids][]']")
  end

  it "shows a submit button" do
    rendered.should have_selector("input[type='submit']")
  end
end
