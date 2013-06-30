FactoryGirl.define do
  factory :sauce do
    name "Sauce Name"
    association :manufacturer, :factory => :manufacturer
  end
end
