require 'spec_helper'

describe "reviews/_index_partial" do
  before do
    sauce = FactoryGirl.build(:sauce)
    user = FactoryGirl.build(:user)
    flavors = [ FactoryGirl.build(:flavor), FactoryGirl.build(:flavor) ]
    @reviews = [
      FactoryGirl.build(:review, sauce: sauce, user: user, flavors: flavors),
      FactoryGirl.build(:review, sauce: sauce, user: user, flavors: flavors)
    ]
  end

  it "sets the row's id to the review's id" do
    render
    @reviews.each do |review|
      rendered.should have_css("#review-#{review.id}")
    end
  end

  it "shows each review's rating" do
    render
    @reviews.each do |review|
      review.rating.should_not be_nil
      rendered.should have_content(review.rating)
    end
  end

  it "shows each review's user's email" do
    render
    @reviews.each do |review|
      review.user.email.should_not be_nil
      rendered.should have_content(review.user.email)
    end
  end

  it "shows each review's flavors" do
    render
    @reviews.each do |review|
      review.flavors.should_not be_nil
      review.flavors.each do |flavor|
        rendered.should have_content(flavor.name)
      end
    end
  end
end
