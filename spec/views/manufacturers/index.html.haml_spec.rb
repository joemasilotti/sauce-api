require 'spec_helper'

describe "manufacturers/index" do
  before do
    manufacturer1 = FactoryGirl.create(:manufacturer)
    manufacturer2 = FactoryGirl.create(:manufacturer)
    @manufacturers = [manufacturer1, manufacturer2]
    render
  end

  it "should render the nav partial" do
    expect(response).to render_template(:partial => 'shared/_menu')
  end

  it "should show each manufacturer's properties" do
    @manufacturers.each do |manufacturer|
      rendered.should have_content(manufacturer.name)
    end
  end

  it "should show a link to display and update each manufacturer" do
    @manufacturers.each do |manufacturer|
      rendered.should have_link('Show', href: manufacturer_path(manufacturer))
      rendered.should have_link('Edit', href: edit_manufacturer_path(manufacturer))
    end
  end

  it "should show a link to add a new manufacturer" do
    rendered.should have_link('Add', href: new_manufacturer_path)
  end
end
