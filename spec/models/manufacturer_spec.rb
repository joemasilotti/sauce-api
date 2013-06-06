require 'spec_helper'

describe Manufacturer do
  describe "factories" do
    it "should be valid for manufacturer" do
      FactoryGirl.create(:manufacturer).should be_valid
    end
  end

  describe "validations" do
    it "require a name" do
      FactoryGirl.build(:manufacturer, :name => "").should_not be_valid
    end
  end
end
