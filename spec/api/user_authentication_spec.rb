require 'spec_helper'

describe 'user_authentication' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:sauce) { FactoryGirl.create(:sauce) }
  let!(:flavor1) { FactoryGirl.create(:flavor, name: 'flavor one') }
  let!(:flavor2) { FactoryGirl.create(:flavor, name: 'flavor two') }

  before do
    FactoryGirl.create(:sauce)
    FactoryGirl.create(:flavor, name: 'flavor three')
  end

  describe "creating a review" do
    def do_post
      post "/sauces/#{sauce.id}/reviews.json",
        :auth_token => token,
          :review => {
          :rating => "1",
          :flavor_ids => [ flavor1.id, flavor2.id ]
      }
    end

    before { do_post }

    context "with a valid authentication token" do
      let(:token) { user.authentication_token }

      it "responds with a success message" do
        response.body.should eq(Review.last.to_json)
      end
    end

    context "without an authentication token" do
      let(:token) { nil }

      it "responds with an error message" do
        error = { :error => "You need to sign in before continuing." }
        response.status.should eql(401)
        response.body.should eql(error.to_json)
      end
    end
  end
end
