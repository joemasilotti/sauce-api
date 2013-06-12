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
      before { get:index }

      it "displays a list of sauces" do
        assigns(:sauces).should eq(sauces)
      end

      it "renders the :index view" do
        response.should render_template :index
      end
    end

    context "when requesting JSON" do
      it "renders the sauces in JSON" do
        get :index, :format => :json
        response.body.should == sauces.to_json
      end
    end
  end

  describe "#show" do
    let!(:sauce) { FactoryGirl.create(:sauce) }

    context "when requesting HTML" do
      before { get :show, id: sauce }

      it "display the sauce" do
        assigns(:sauce).should eq(sauce)
      end

      it "renders the :show view" do
        response.should render_template :show
      end
    end

    context "when requesting JSON" do
      it "renders the sauce in JSON" do
        get :show, id: sauce, :format => :json
        response.body.should == sauce.to_json
      end
    end
  end

  describe "#edit" do
    let!(:sauce) { FactoryGirl.create(:sauce) }
    let!(:flavors) { [ FactoryGirl.create(:flavor), FactoryGirl.create(:flavor) ] }

    context "when requesting HTML" do
      before { get :edit, id: sauce }

      it "display the sauce" do
        assigns(:sauce).should eq(sauce)
      end

      it "renders the :edit view" do
        response.should render_template :edit
      end
    end

    context "when the sauce was successfully updated" do
      before { put :update, :id => sauce, :sauce => { :name => "New Name", :flavor_ids => flavors } }

      it "should set the flash message" do
        flash[:notice].should == "Sauce was successfully updated."
      end

      it "should redirect to the show page" do
        response.should redirect_to sauce_path(assigns(:sauce))
      end
    end

    context "when the sauce update has errors" do
      context "when the name is missing" do
        before { put :update, :id => sauce, :sauce => { :name => nil } }

        it "should set the flash message" do
          flash[:alert].should == "Name can't be blank."
        end

        it "show the edit page again" do
          response.should render_template :edit
        end
      end

      context "when the manufacturer is missing" do
        before { put :update, :id => sauce, :sauce => { :manufacturer_id => nil } }

        it "should set the flash message" do
          flash[:alert].should == "Manufacturer can't be blank."
        end

        it "show the edit page again" do
          response.should render_template :edit
        end
      end

      context "when both the manufacturer and name are missing" do
        before { put :update, :id => sauce, :sauce => { :name => nil, :manufacturer_id => nil } }

        it "should set the flash message" do
          flash[:alert].should == "Manufacturer can't be blank. Name can't be blank."
        end

        it "show the edit page again" do
          response.should render_template :edit
        end
      end
    end
  end

  describe "#new" do
    let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

    context "when requesting HTML" do
      it "renders the :new view" do
        get :new
        response.should render_template :new
      end
    end

    context "when the sauce was successfully added" do
      def do_post
        post :create, :sauce => {
          :name => 'name',
          :manufacturer_id => manufacturer
        }
      end

      it "should increase the sauce count by one" do
        lambda { do_post }.should change(Sauce, :count).by(1)
      end

      it "should set the flash message" do
        do_post
        flash[:notice].should == "Sauce was successfully added."
      end

      it "should redirect to the show page" do
        do_post.should redirect_to sauce_path(assigns(:sauce))
      end
    end

    context "when the sauce creation has errors" do
      context "when only the manufacturer is set" do
        before { post :create, :sauce => { :name => nil, :manufacturer_id => manufacturer } }

        it "should show a flash message" do
          flash[:alert].should == "Name can't be blank."
        end

        it "show the new page again" do
          response.should render_template :new
        end
      end

      context "when neither the name nor manufacturer are set" do
        before { post :create, :sauce => { :name => nil, :manufacturer_id => nil } }

        it "should show a flash message" do
          flash[:alert].should == "Manufacturer can't be blank. Name can't be blank."
        end

        it "show the new page again" do
          response.should render_template :new
        end
      end
    end
  end

  describe "#destroy" do
    let!(:sauce) { FactoryGirl.create(:sauce) }

    def do_delete
      delete :destroy, :id => sauce
    end

    it "should destroy the sauce" do
      lambda { do_delete }.should change(Sauce, :count).by(-1)
    end

    it "should set the flash message" do
      do_delete
      flash[:notice].should == "Sauce was successfully deleted."
    end

    it "should redirect to the index page" do
      do_delete
      expect(response).to redirect_to sauces_path
    end
  end
end
