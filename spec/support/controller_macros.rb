module ControllerMacros
  def login_admin
    before do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
    end
  end

  shared_examples_for "an admin only action" do
    it "should set the flash message" do
      flash[:alert].should == "You need to sign in or sign up before continuing."
    end

    it "should redirect to the index page" do
      response.should redirect_to(new_admin_session_path)
    end
  end
end
