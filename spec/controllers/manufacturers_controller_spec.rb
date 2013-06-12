require 'spec_helper'

describe ManufacturersController do
  context "routing" do
    it "routes /manufacturers to manufacturers#index" do
      { :get => "/manufacturers" }.should route_to("manufacturers#index")
    end

    it "routes /manufacturers/1 to manufacturers#show" do
      { :get => "/manufacturers/1" }.should route_to(:controller => "manufacturers", :action =>"show", :id => "1")
    end

    it "routes /manufacturers/1/edit to manufacturers#edit" do
      { :get => "manufacturers/1/edit" }.should route_to(:controller => "manufacturers", :action => "edit", :id => "1")
    end

    it "routes /manufacturers/new to manufacturers#add" do
      { :get => "manufacturers/new" }.should route_to(:controller => "manufacturers", :action => "new")
    end

    it "routes /manufacturers/1/delete to manufacturers#destroy" do
      { :delete => "manufacturers/1" }.should route_to(:controller => "manufacturers", :action => "destroy", :id => "1")
    end
  end

  describe "#index" do
    let!(:manufacturers) { [ FactoryGirl.create(:manufacturer), FactoryGirl.create(:manufacturer) ] }

    context "when requesting HTML" do
      before { get :index }

      it "displays a list of manufacturers" do
        assigns(:manufacturers).should eq(manufacturers)
      end

      it "renders the :index view" do
        response.should render_template :index
      end
    end

    context "when requesting JSON" do
      it "renders the manufacturers in JSON" do
        get :index, :format => :json
        response.body.should == manufacturers.to_json
      end
    end
  end

  describe "#show" do
    let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

    context "when requesting HTML" do
      before { get :show, id: manufacturer }

      it "display the manufacturer" do
        assigns(:manufacturer).should eq(manufacturer)
      end

      it "renders the :show view" do
        response.should render_template :show
      end
    end

    context "when requesting JSON" do
      it "renders the manufacturer in JSON" do
        get :show, id: manufacturer, :format => :json
        response.body.should == manufacturer.to_json
      end
    end
  end

  describe "#edit" do
    let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

    context "when requesting HTML" do
      before { get :edit, id: manufacturer }

      it "display the manufacturer" do
        assigns(:manufacturer).should eq(manufacturer)
      end

      it "renders the :edit view" do
        response.should render_template :edit
      end
    end

    context "when the manufacturer was successfully updated" do
      before { put :update, :id => manufacturer, :manufacturer => { :name => "New Name" } }

      it "should set the flash message" do
        flash[:notice].should == "Manufacturer was successfully updated."
      end

      it "should redirect to the show page" do
        response.should redirect_to manufacturer_path(assigns(:manufacturer))
      end
    end

    context "when the manufacturer update has errors" do
      before { put :update, :id => manufacturer, :manufacturer => { :name => nil } }

      it "should set the flash message" do
        flash[:alert].should == "Name can't be blank."
      end

      it "show the edit page again" do
        response.should render_template :edit
      end
    end
  end

  describe "#new" do
    context "when requesting HTML" do
      it "renders the :new view" do
        get :new
        response.should render_template :new
      end
    end

    context "when the manufacturer was successfully added" do
      def do_post
        post :create, :manufacturer => {
          :name => 'Name',
        }
      end

      it "should increase the manufacturer count by one" do
        lambda { do_post }.should change(Manufacturer, :count).by(1)
      end

      it "should set the flash message" do
        do_post
        flash[:notice].should == "Manufacturer was successfully added."
      end

      it "should redirect to the show page" do
        do_post.should redirect_to manufacturer_path(assigns(:manufacturer))
      end
    end

    context "when the manufacturer creation has errors" do
      before { post :create, :manufacturer => { :name => nil } }

      it "should set the flash message" do
        flash[:alert].should == "Name can't be blank."
      end

      it "show the new page again" do
        response.should render_template :new
      end
    end
  end

  describe "#destroy" do
    let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

    def do_delete
      delete :destroy, :id => manufacturer
    end

    it "should destroy the manufacturer" do
      lambda { do_delete }.should change(Manufacturer, :count).by(-1)
    end

    it "should set the flash message" do
      do_delete
      flash[:notice].should == "Manufacturer was successfully deleted."
    end

    it "should redirect to the index page" do
      do_delete
      expect(response).to redirect_to manufacturers_path
    end
  end
end
