FactoryGirl.define do
  factory :product do
    name Faker::Name.name
    description Faker::Name.title
    price Faker::Number.between(1, 1000)
  end
end