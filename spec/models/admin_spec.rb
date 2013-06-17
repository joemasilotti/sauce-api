require 'spec_helper'

describe Admin do
  describe "factories" do
    it "should be valid for admin" do
      FactoryGirl.create(:admin).should be_valid
    end
  end
end
