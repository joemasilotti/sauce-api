require 'spec_helper'

describe "sauces/show" do
  let!(:sauce) { FactoryGirl.create(:sauce) }

  before do
    assign(:sauce, sauce)
    assign(:reviews, sauce.reviews)
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show the sauce name" do
    rendered.should have_content(sauce.name)
  end

  it "should show the sauce manufacturer name" do
    rendered.should have_content(sauce.manufacturer.name)
  end

  it "renders the sauce's reviews partial" do
    expect(response).to render_template(:partial => '_index_partial')
  end
end
