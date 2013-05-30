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

    it "routes /sauces/1/edit to sauces#edit" do
      { :get => "sauces/1/edit" }.should route_to(:controller => "sauces", :action => "edit", :id => "1")
    end

    it "routes /sauces/new to sauces#add" do
      { :get => "sauces/new" }.should route_to(:controller => "sauces", :action => "new")
    end

    it "routes /sauces/1/delete to sauces#destroy" do
      { :delete => "sauces/1" }.should route_to(:controller => "sauces", :action => "destroy", :id => "1")
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

  describe "#edit" do
    let!(:sauce) { FactoryGirl.create(:sauce) }

    context "when requesting HTML" do
      it "display the sauce" do
        get :edit, id: sauce
        assigns(:sauce).should eq(sauce)
      end

      it "renders the :edit view" do
        get :edit, id: sauce
        response.should render_template :edit
      end
    end

    context "when the sauce was successfully updated" do
      it "should redirect to the show page" do
        put :update, :id => sauce, :sauce => { :name => "New Name" }
        response.should redirect_to sauce_path(assigns(:sauce))
      end
    end

    context "when the sauce update has errors" do
      it "show the edit page again" do
        put :update, :id => sauce, :sauce => { :name => nil }
        response.should render_template :edit
      end
    end
  end

  describe "#new" do
    def do_post
      post :create, :sauce => {
        :name => 'name',
        :manufacturer => 'manufacturer'
      }
    end

    context "when requesting HTML" do
      it "renders the :new view" do
        get :new
        response.should render_template :new
      end
    end

    context "when the sauce was successfully added" do
      it "should increase the sauce count by one" do
        lambda { do_post }.should change(Sauce, :count).by(1)
      end
      
      it "should redirect to the show page" do
        do_post.should redirect_to sauce_path(assigns(:sauce))
      end
    end

    context "when the sauce creation has errors" do
      before { post :create, :sauce => { :name => nil, :manufacturer => 'manufacturer' } }

      it "show the new page again" do
        response.should render_template :new
      end
    end
  end

  describe "#destroy" do
    let!(:sauce) { FactoryGirl.create(:sauce) }

    it "should destroy the sauce" do
      lambda { delete :destroy, :id => sauce }.should change(Sauce, :count).by(-1)
    end

    it "should redirect to the index page" do
      delete :destroy, :id => sauce
      expect(response).to redirect_to sauces_path
    end
  end
end
