require 'spec_helper'

describe ReviewsController do
  context "routing" do
    it "routes /sauces/1/reviews to reviews#index" do
      { get: "/sauces/1/reviews" }.should route_to(controller: "reviews", action: "index", sauce_id: "1")
    end

    it "routes /sauces/1/reviews/1 to reviews#show" do
      { get: "/sauces/1/reviews/1" }.should route_to(controller: "reviews", action: "show", sauce_id: "1", id: "1")
    end

    it "routes /sauces/1/reviews/new to reviews#add" do
      { get: "sauces/1/reviews/new" }.should route_to(controller: "reviews", action: "new", sauce_id: "1")
    end
  end

  describe "#index" do
    let(:sauce) { FactoryGirl.create(:sauce) }
    let!(:reviews) { [ FactoryGirl.create(:review, sauce: sauce), FactoryGirl.create(:review, sauce: sauce) ] }
    let!(:other_reviews) { FactoryGirl.create(:review) }

    context "when requesting HTML" do
      it "displays that sauce's reviews" do
        get :index, sauce_id: sauce
        assigns(:reviews).should eq(reviews)
      end

      it "renders the index view" do
        get :index, sauce_id: sauce
        response.should render_template :index
      end

      context "when requesting JSON" do
        it "renders the reviews in JSON" do
          get :index, sauce_id: sauce, format: :json
          response.body.should == reviews.to_json
        end
      end
    end
  end

  describe "#show" do
    let(:sauce) { FactoryGirl.create(:sauce) }
    let!(:review) { FactoryGirl.create(:review) }

    context "when requesting HTML" do
      before { get :show, sauce_id: sauce, id: review }

      it "display the review" do
        assigns(:review).should eq(review)
      end

      it "renders the show view" do
        response.should render_template :show
      end
    end

    context "when requesting JSON" do
      it "renders the review in JSON" do
        get :show, sauce_id: sauce, id: review, format: :json
        response.body.should == review.to_json
      end
    end
  end

  describe "#new" do
    let(:sauce) { FactoryGirl.create(:sauce) }

    context "when the user is logged in as a user" do
      login_user

      before do
        @review = mock(:review)
        Review.stub(:new).and_return(@review)
        get :new, sauce_id: sauce
      end

      context "when requesting HTML" do
        it "assigns a new review" do
          assigns(:review).should eq(@review)
        end

        it "assigns the parent sauce" do
          assigns(:sauce).should eq(sauce)
        end

        it "renders the :new view" do
          response.should render_template :new
        end
      end
    end

    context "when the user is not logged in" do
      before { get :new, sauce_id: sauce }

      it_should_behave_like "a user only action"
    end
  end

  describe "#create" do
    before do
      @sauce = FactoryGirl.create(:sauce)
      @flavor = FactoryGirl.create(:flavor)
    end

    def do_post
      post :create, 
        sauce_id: @sauce,
        review: { rating: "1" , flavor_ids: [ @flavor ] }
    end

    context "when the user is logged in as a user" do
      @user = login_user

      context "when the review was successfully added" do
        it "should increase the review count by one" do
          lambda { do_post }.should change(Review, :count).by(1)
        end

        it "should set the flash message" do
          do_post
          flash[:notice].should == "Review was successfully added."
        end

        it "should redirect to the sauce's show page" do
          do_post.should redirect_to sauce_path(assigns(:sauce))
        end
      end

      context "when the review creation has errors" do
        context "when the rating isn't set" do
          before do
            post :create, sauce_id: @sauce,
              review: { rating: nil }
          end

          it "should show a flash message" do
            flash[:alert].should == "Rating is not included in the list."
          end

          it "show the new page again" do
            response.should render_template :new
          end
        end
      end
    end

    context "when the user is not logged in" do
      before { do_post }

      it_should_behave_like "a user only action"
    end
  end
end
