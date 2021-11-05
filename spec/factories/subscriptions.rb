FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { rand(10.0..100.0).round(2) }
    status { ['unsubscribed', 'subscribed', 'canceled'].sample }
    frequency { Faker::Time.backward(days: 5, period: :morning, format: :short) }
    customer
    tea
  end
end
