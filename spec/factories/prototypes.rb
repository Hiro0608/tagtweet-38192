FactoryBot.define do
  factory :prototype do
    title          { Faker::Lorem.word }
    catch_copy     { Faker::Lorem.word }
    concept        { Faker::Lorem.sentence }
    
    association :user
    after(:build) do |prototype|
      prototype.image.attach(io: File.open('public/images/test_image.jpeg'), filename: "test_image.jpeg")
    end
  end
end