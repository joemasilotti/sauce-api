require 'spec_helper'

describe "shared/_menu" do
  before do
    render
  end

  it "should have a link to the sauces index page" do
    response.should have_link("Sauces", href: sauces_path)
  end

  it "should have a link to the manufacturers index page" do
    response.should have_link("Manufacturers", href: manufacturers_path)
  end

  it "should have a link to the flavors index page" do
    response.should have_link("Flavors", href: flavors_path)
  end
end
