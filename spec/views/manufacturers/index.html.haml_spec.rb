require 'spec_helper'

describe "manufacturers/index" do
  before do
    manufacturer1 = FactoryGirl.create(:manufacturer)
    manufacturer2 = FactoryGirl.create(:manufacturer)
    @manufacturers = [manufacturer1, manufacturer2]
    @actions = []
  end

  it "should render the nav partial" do
    render
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show each manufacturer's properties" do
    render
    @manufacturers.each do |manufacturer|
      rendered.should have_css("#manufacturer-#{manufacturer.id}")
      rendered.should have_content(manufacturer.name)
      rendered.should have_content(manufacturer.name)
    end
  end

  describe "manufacturer actions" do
    it "each manufacturer should display links for each action set" do
      @actions = [:show, :edit, :add]
      render

      @manufacturers.each do |manufacturer|
        rendered.should have_link('Show', href: manufacturer_path(manufacturer))
        rendered.should have_link('Edit', href: edit_manufacturer_path(manufacturer))
      end
      rendered.should have_link('Add', href: new_manufacturer_path)
    end

    it "should not show links for actions not set" do
      @actions.should be_empty
      render

      @manufacturers.each do |manufacturer|
        rendered.should_not have_link('Show', href: manufacturer_path(manufacturer))
        rendered.should_not have_link('Edit', href: edit_manufacturer_path(manufacturer))
        rendered.should_not have_link('Delete', href: manufacturer_path(manufacturer))
      end
      rendered.should_not have_link('Add', href: new_manufacturer_path)
    end
  end
end
