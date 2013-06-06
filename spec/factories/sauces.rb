FactoryGirl.define do
  factory :sauce do |sauce|
    sauce.name "Sauce Name"
    sauce.association :manufacturer, :factory => :manufacturer
  end
end
