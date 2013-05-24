require 'spec_helper'

describe SaucesController do
  context "routing" do
    it "root routes to sauces#index" do
      { :get => "/"}.should route_to("sauces#index")
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
end
