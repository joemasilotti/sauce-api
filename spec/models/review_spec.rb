require 'spec_helper'

describe Review do
  describe "factories" do
    it "has a user" do
      FactoryGirl.build(:review).user.should be_present
    end

    it "has a sauce" do
      FactoryGirl.build(:review).sauce.should be_present
    end
  end

  describe "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:sauce) }
    it { should have_and_belong_to_many(:flavors) }
    it { should ensure_inclusion_of(:rating).in_range(-1..1) }
  end
end
