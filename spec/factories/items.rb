FactoryBot.define do
  factory :item do
    image       {Faker::Lorem.sentence}
    title       {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 11)}
    state_id    {Faker::Number.between(from: 2, to: 7)}
    fee_id      {Faker::Number.between(from: 2, to: 3)}
    area_id     {Faker::Number.between(from: 2, to: 48)}
    day_id      {Faker::Number.between(from: 2, to: 4)}
    price       {Faker::Number.between(from: 333, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
