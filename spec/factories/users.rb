FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    name                  { Faker::Name.name }
    profile               { Faker::Name.name }
    occupation            { Faker::Name.name }
    position              { Faker::Name.name }
  end
end
