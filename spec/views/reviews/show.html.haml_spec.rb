require 'spec_helper'

describe "reviews/show" do
  let(:review) { FactoryGirl.build(:review) }

  before(:each) do
    review.flavors = [ FactoryGirl.build(:flavor), FactoryGirl.build(:flavor) ]
    assign(:review, review)
    render
  end

  it "renders the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "shows the flavors" do
    review.flavors.each do |flavor|
      rendered.should have_content(flavor.name)
    end
  end

  it "shows the rating" do
    rendered.should have_content(review.rating)
  end
end
