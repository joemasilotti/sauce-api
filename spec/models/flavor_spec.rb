require 'spec_helper'

describe Flavor do
  describe "factories" do
    it "should be valid for flavor" do
      FactoryGirl.create(:flavor).should be_valid
    end
  end

  describe "validations" do
    it "require a name" do
      FactoryGirl.build(:flavor, :name => "").should_not be_valid
    end
  end
end
