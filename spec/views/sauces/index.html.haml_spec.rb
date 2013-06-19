require 'spec_helper'

describe "sauces/index" do
  before do
    sauce1 = FactoryGirl.create(:sauce)
    sauce2 = FactoryGirl.create(:sauce)
    @sauces = [sauce1, sauce2]
    @actions = []
  end

  it "should render the nav partial" do
    render
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show each sauce's properties" do
    render
    @sauces.each do |sauce|
      rendered.should have_content(sauce.name)
      rendered.should have_content(sauce.manufacturer.name)
    end
  end

  describe "sauce actions" do
    it "each sauce should display links for each action set" do
      @actions = [:show, :edit, :delete, :add]
      render

      @sauces.each do |sauce|
        rendered.should have_link('Show', href: sauce_path(sauce))
        rendered.should have_link('Edit', href: edit_sauce_path(sauce))
        rendered.should have_link('Delete', href: sauce_path(sauce))
      end
      rendered.should have_link('Add', href: new_sauce_path)
    end

    it "should not show links for actions not set" do
      @actions.should be_empty
      render

      @sauces.each do |sauce|
        rendered.should_not have_link('Show', href: sauce_path(sauce))
        rendered.should_not have_link('Edit', href: edit_sauce_path(sauce))
        rendered.should_not have_link('Delete', href: sauce_path(sauce))
      end
      rendered.should_not have_link('Add', href: new_sauce_path)
    end
  end
end
