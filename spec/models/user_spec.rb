require 'spec_helper'

describe User do
  describe "factories" do
    it "has an email" do
      FactoryGirl.build(:user).email.should be_present
    end

    it "is valid" do
      FactoryGirl.create(:user).should be_valid
    end
  end

  describe "validations" do
    it { should have_many(:reviews) }
  end

  describe "before_save" do
    it "adds an authentication token" do
      user = FactoryGirl.build(:user)
      user.save
      user.authentication_token.should_not be_nil
    end
  end
end
