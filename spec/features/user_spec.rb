require 'spec_helper'

feature 'user' do
  let (:user) { FactoryGirl.create(:user) }

  before do
    FactoryGirl.create(:sauce)
    FactoryGirl.create(:sauce)
    FactoryGirl.create(:flavor, name: 'bitter')
    FactoryGirl.create(:flavor, name: 'sweet')
    FactoryGirl.create(:flavor, name: 'sour')
  end

  scenario "user creates a review" do
    visit root_path

    click_link "Log In User"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    page.should have_content("Signed in successfully.")

    visit root_path

    within "#sauce-#{Sauce.last.id}" do
      click_link "Review"
    end

    choose "1"
    check "bitter"
    check "sour"

    click_button "Create Review"

    page.should have_content("Review was successfully added.")
  end
end
