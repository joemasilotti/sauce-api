require 'spec_helper'

describe FlavorsController do
  context "routing" do
    it "routes /flavors to flavors#index" do
      { :get => "/flavors" }.should route_to("flavors#index")
    end

    it "routes /flavors/1 to flavors#show" do
      { :get => "/flavors/1" }.should route_to(:controller => "flavors", :action =>"show", :id => "1")
    end

    it "routes /flavors/1/edit to flavors#edit" do
      { :get => "flavors/1/edit" }.should route_to(:controller => "flavors", :action => "edit", :id => "1")
    end

    it "routes /flavors/new to flavors#add" do
      { :get => "flavors/new" }.should route_to(:controller => "flavors", :action => "new")
    end

    it "routes /pepeprs/1/delete to flavors#destroy" do
      { :delete => "flavors/1" }.should route_to(:controller => "flavors", :action => "destroy", :id => "1")
    end
  end

  describe "#index" do
    let!(:flavors) { [ FactoryGirl.create(:flavor), FactoryGirl.create(:flavor) ] }

    context "when requesting HTML" do
      it "displays a list of flavors" do
        get :index
        assigns(:flavors).should eq(flavors)
      end

      it "renders the :index view" do
        get :index
        response.should render_template :index
      end

      context "when the user is logged in as an admin" do
        login_admin

        it "should pass the show, edit, and delete actions" do
          get :index
          assigns(:actions).should eq([:show, :edit, :delete])
        end
      end

      context "when the user is not logged in" do
        it "should pass only the show action" do
          get :index
          assigns(:actions).should eq([:show])
        end
      end
    end

    context "when requesting JSON" do
      it "renders the flavors in JSON" do
        get :index, :format => :json
        response.body.should == flavors.to_json
      end
    end
  end

  describe "#show" do
    let!(:flavor) { FactoryGirl.create(:flavor) }

    context "when requesting HTML" do
      before { get :show, id: flavor }

      it "display the flavor" do
        assigns(:flavor).should eq(flavor)
      end

      it "renders the :show view" do
        response.should render_template :show
      end
    end

    context "when requesting JSON" do
      it "renders the flavor in JSON" do
        expected = flavor.to_json
        get :show, id: flavor, :format => :json
        response.body.should == expected
      end
    end
  end

  describe "#edit" do
    let!(:flavor) { FactoryGirl.create(:flavor) }

    context "when the user is logged in as an admin" do
      login_admin

      context "when requesting HTML" do
        before { get :edit, id: flavor }

        it "display the flavor" do
          assigns(:flavor).should eq(flavor)
        end

        it "renders the :edit view" do
          response.should render_template :edit
        end
      end
    end

    context "when the user is not logged in" do
      before { get :edit, id: flavor }

      it_should_behave_like "an admin only action"
    end
  end

  describe "#update" do
    let!(:flavor) { FactoryGirl.create(:flavor) }

    context "when the user is logged in as an admin" do
      login_admin

      context "when the flavor was successfully updated" do
        before { put :update, :id => flavor, :flavor => { :name => "New Name" } }

        it "should set the flash message" do
          flash[:notice].should == "Flavor was successfully updated."
        end

        it "should redirect to the show page" do
          response.should redirect_to flavor_path(assigns(:flavor))
        end
      end

      context "when the flavor update has errors" do
        before { put :update, :id => flavor, :flavor => { :name => nil } }

        it "should set the flash message" do
          flash[:alert].should == "Name can't be blank."
        end

        it "show the edit page again" do
          response.should render_template :edit
        end
      end
    end

    context "when the user is not logged in" do
      before { put :update, :id => flavor, :flavor => { :name => "New Name" } }

      it_should_behave_like "an admin only action"
    end
  end

  describe "#new" do
    context "when the user is logged in as an admin" do
      login_admin

      context "when requesting HTML" do
        it "renders the :new view" do
          get :new
          response.should render_template :new
        end
      end
    end

    context "when the user is not logged in" do
      before { get :new }

      it_should_behave_like "an admin only action"
    end
  end

  describe "#create" do
    def do_post
      post :create, :flavor => {
        :name => 'name',
      }
    end

    context "when the user is logged in as an admin" do
      login_admin

      context "when the flavor was successfully added" do
        it "should increase the flavor count by one" do
          lambda { do_post }.should change(Flavor, :count).by(1)
        end

        it "should set the flash message" do
          do_post
          flash[:notice].should == "Flavor was successfully added."
        end

        it "should redirect to the show page" do
          do_post.should redirect_to flavor_path(assigns(:flavor))
        end
      end

      context "when the flavor creation has errors" do
        before { post :create, :flavor => { :name => nil } }

        it "should set the flash message" do
          flash[:alert].should == "Name can't be blank."
        end

        it "show the new page again" do
          response.should render_template :new
        end
      end
    end

    context "when the user is not logged in" do
      before { do_post }

      it_should_behave_like "an admin only action"
    end
  end

  describe "#destroy" do
    let!(:flavor) { FactoryGirl.create(:flavor) }

    def do_delete
      delete :destroy, :id => flavor
    end

    context "when the user is logged in as an admin" do
      login_admin

      it "should destroy the flavor" do
        lambda { do_delete }.should change(Flavor, :count).by(-1)
      end

      it "should set the flash message" do
        do_delete
        flash[:notice].should == "Flavor was successfully deleted."
      end

      it "should redirect to the flavors index page" do
        do_delete
        expect(response).to redirect_to flavors_path
      end
    end

    context "when the user is not logged in" do
      before { do_delete }

      it_should_behave_like "an admin only action"
    end
  end
end
