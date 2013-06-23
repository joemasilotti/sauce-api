require 'spec_helper'

describe User do
  describe "factories" do
    it "should be valid for user" do
      FactoryGirl.create(:user).should be_valid
    end
  end
end
