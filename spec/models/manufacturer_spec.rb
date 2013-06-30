require 'spec_helper'

describe Manufacturer do
  describe "factories" do
    it "has a name" do
      FactoryGirl.build(:manufacturer).name.should be_present
    end

    it "is valid" do
      FactoryGirl.create(:manufacturer).should be_valid
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
