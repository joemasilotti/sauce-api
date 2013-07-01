FactoryGirl.define do
  sequence(:email) {|n| "#{n}#{Faker::Internet.email}" }

  factory :admin do
    email
    password "password"
  end
end
