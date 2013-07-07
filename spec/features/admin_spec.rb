require 'spec_helper'

feature 'admin' do
  let (:admin) { FactoryGirl.create(:admin) }

  before do
    FactoryGirl.create(:manufacturer, name: "Manufacturer One")
    FactoryGirl.create(:manufacturer, name: "Manufacturer Two")
  end

  scenario "admin creates a sauce" do
    visit root_path

    click_link "Log In Admin"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password

    click_button "Sign in"

    page.should have_content("Signed in successfully.")

    visit root_path

    click_link "Add New Sauce"

    fill_in "Name", with: "New Sauce"
    select "Manufacturer Two"

    click_button "Create Sauce"

    page.should have_content("Sauce was successfully added.")
  end

  scenario "admin creates a flavor" do
    visit root_path

    click_link "Log In Admin"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password

    click_button "Sign in"

    page.should have_content("Signed in successfully.")

    visit flavors_path

    click_link "Add New Flavor"

    fill_in "Name", with: "New Flavor"

    click_button "Create Flavor"

    page.should have_content("Flavor was successfully added.")
  end

  scenario "admin creates a manufacturer" do
    visit root_path

    click_link "Log In Admin"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password

    click_button "Sign in"

    page.should have_content("Signed in successfully.")

    visit manufacturers_path

    click_link "Add New Manufacturer"

    fill_in "Name", with: "New Manufacturer"

    click_button "Create Manufacturer"

    page.should have_content("Manufacturer was successfully added.")
  end
end
