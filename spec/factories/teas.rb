FactoryBot.define do
  factory :tea do
    title { Faker::Tea.type }
    description { Faker::Tea.variety }
    temperature { Faker::JapaneseMedia::Naruto.character }
    brew_time { Faker::JapaneseMedia::Naruto.village }
  end
end
