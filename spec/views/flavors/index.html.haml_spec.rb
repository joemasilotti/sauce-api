require 'spec_helper'

describe "flavors/index" do
  before do
    flavor1 = FactoryGirl.create(:flavor)
    flavor2 = FactoryGirl.create(:flavor)
    @flavors = [flavor1, flavor2]
    @actions = []
  end

  it "should render the nav partial" do
    render
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show each flavor's properties" do
    render
    @flavors.each do |flavor|
      rendered.should have_content(flavor.name)
    end
  end

  describe "flavor actions" do
    it "each flavor should display links for each action set" do
      @actions = [:show, :edit, :delete, :add]
      render

      @flavors.each do |flavor|
        rendered.should have_link('Show', href: flavor_path(flavor))
        rendered.should have_link('Edit', href: edit_flavor_path(flavor))
        rendered.should have_link('Delete', href: flavor_path(flavor))
      end
      rendered.should have_link('Add', href: new_flavor_path)
    end

    it "should not show links for actions not set" do
      @actions.should be_empty
      render

      @flavors.each do |flavor|
        rendered.should_not have_link('Show', href: flavor_path(flavor))
        rendered.should_not have_link('Edit', href: edit_flavor_path(flavor))
        rendered.should_not have_link('Delete', href: flavor_path(flavor))
      end
      rendered.should_not have_link('Add', href: new_flavor_path)
    end
  end
end
