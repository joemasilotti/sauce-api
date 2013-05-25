require 'spec_helper'

describe SaucesController do
  context "routing" do

    it "routes root to sauces#index" do
      { :get => "/" }.should route_to("sauces#index")
    end

    it "routes /sauces to sauces#index" do
      { :get => "/sauces" }.should route_to("sauces#index")
    end

    it "routes /sauces/1 to sauces#show" do
      { :get => "/sauces/1" }.should route_to(:controller => "sauces", :action =>"show", :id => "1")
    end
  end

  describe "#index" do
    let!(:sauces) { [ FactoryGirl.create(:sauce), FactoryGirl.create(:sauce) ] }

    context "when requesting HTML" do
      it "displays a list of sauces" do
        get :index
        assigns(:sauces).should eq(sauces)
      end

      it "renders the :index view" do
        get :index
        response.should render_template :index
      end
    end

    context "when requesting JSON" do
      it "renders the sauces in JSON" do
        expected = sauces.to_json
        get :index, :format => :json
        response.body.should == expected
      end
    end
  end

  describe "#show" do
    let!(:sauce) { FactoryGirl.create(:sauce) }

    context "when requesting HTML" do
      it "display the sauce" do
        get :show, id: sauce
        assigns(:sauce).should eq(sauce)
      end

      it "renders the :show view" do
        get :show, id: sauce
        response.should render_template :show
      end
    end

    context "when requesting JSON" do
      it "renders the sauce in JSON" do
        expected = sauce.to_json
        get :show, id: sauce, :format => :json
        response.body.should == expected
      end
    end
  end
end
