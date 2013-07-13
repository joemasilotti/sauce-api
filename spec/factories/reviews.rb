FactoryGirl.define do
  factory :review do
    association :user, :factory => :user
    association :sauce, :factory => :sauce
    rating 1
  end
end
