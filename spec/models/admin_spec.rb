require 'spec_helper'

describe Admin do
  describe "factories" do
    it "has an email" do
       FactoryGirl.build(:admin).email.should be_present
    end

    it "is valid" do
      FactoryGirl.create(:admin).should be_valid
    end
  end
end
