require 'spec_helper'

describe Flavor do
  describe "factories" do
    it "has a name" do
      FactoryGirl.build(:flavor).name.should be_present
    end

    it "is valid" do
      FactoryGirl.create(:flavor).should be_valid
    end

    describe "validations" do
      it { should have_and_belong_to_many(:reviews) }
      it { should validate_presence_of(:name) }
    end
  end
end
