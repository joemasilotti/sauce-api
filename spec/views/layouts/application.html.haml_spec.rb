require 'spec_helper'

describe "layouts/application" do
  before do
    render
  end

  it "should set the title of the page to Sauce API" do
    page.should have_title('Sauce API')
  end

  it "should show a header with the name of the app" do
    render
    page.should have_content('Sauce API')
  end

  describe "flash messages" do
    context "when there is a notice flash message" do
      before do
        flash[:notice] = "Notice message."
        render
      end

      it "should display the notice message" do
        page.find('.alert-success', :text => "Notice message.")
      end
    end

    context "when there isn't a notice flash message" do
      before do
        flash[:notice].should be_nil
        render
      end

      it "should not display any alert scaffolding" do
        page.should_not have_css('.alert')
      end
    end
  end
end
