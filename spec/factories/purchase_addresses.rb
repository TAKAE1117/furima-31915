FactoryBot.define do
  factory :purchase_address do
    postal_code              { '123-4567' }
    prefecture_id            {Faker::Number.between(from: 2, to: 48) }
    municipality             {Faker::Address.city}
    address                  {Faker::Address.street_name}
    phone_number             { '09012345678' }
  end
end
