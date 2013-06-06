require 'spec_helper'

describe Sauce do
  describe "factories" do
    it "should be valid for sauce" do
      FactoryGirl.create(:sauce).should be_valid
    end
  end

  describe "validations" do
    it "require a name" do
      FactoryGirl.build(:sauce, :name => "").should_not be_valid
    end

    it "require a manufacturer" do
      FactoryGirl.build(:sauce, :manufacturer => nil).should_not be_valid
    end
  end
end
