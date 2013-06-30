require 'spec_helper'

describe Sauce do
  describe "factories" do
    it "has a name" do
      FactoryGirl.build(:sauce).name.should be_present
    end

    it "has a manufacturer" do
      FactoryGirl.build(:sauce).manufacturer.should be_present
    end

    it "is valid" do
      FactoryGirl.create(:sauce).should be_valid
    end
  end

  describe "validations" do
    it { should belong_to(:manufacturer) }
    it { should have_and_belong_to_many(:flavors) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:manufacturer) }
  end
end
