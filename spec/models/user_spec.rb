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
end
