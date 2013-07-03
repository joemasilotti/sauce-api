require 'spec_helper'

describe "reviews/index" do
  before do
    assign(:reviews, [
      stub_model(Review,
        rating: 0,
        user: stub_model(User, email: 'reviewer@example.com')
      ),
      stub_model(Review,
        rating: -1,
        user: stub_model(User, email: 'reviewer@example.com')
      )
    ])
  end

  it "should render the nav partial" do
    render
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "renders the review partial" do
    render
    expect(response).to render_template(:partial => '_index_partial')
  end
end
