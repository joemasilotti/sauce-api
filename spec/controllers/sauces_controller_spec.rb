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
    it "displays a list of sauces" do
      sauce1 = FactoryGirl.create(:sauce)
      sauce2 = FactoryGirl.create(:sauce)
      get :index
      assigns(:sauces).should eq([sauce1, sauce2])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "#show" do
    it "display the sauce" do
      sauce = FactoryGirl.create(:sauce)
      get :show, id: sauce
      assigns(:sauce).should eq(sauce)
    end

    it "renders the :show view" do
      get :show, id: FactoryGirl.create(:sauce)
      response.should render_template :show
    end
  end
end
