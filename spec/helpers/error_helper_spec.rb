require 'spec_helper'

describe ErrorHelper do
  describe '#error_messages' do
    let(:errors) { double("errors") }

    context "when one error is passed" do
      it "should return the message followed by a period" do
        errors.stub(:full_messages) { [ "first error message" ] }
        error_messages(errors).should == "first error message."
      end
    end

    context "when two errors are" do
      it "should return the first message, a period, the second message, then a period" do
        errors.stub(:full_messages) { [ "first error message", "second error message" ] }
        error_messages(errors).should == "first error message. second error message."
      end
    end

    context "when there are no errors" do
      it "should return nothing" do
        errors.stub(:full_messages) { [ ] }
        error_messages(errors).should == nil
      end
    end
  end
end
