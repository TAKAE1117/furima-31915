FactoryBot.define do
  factory :purchase_address do
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality  { Faker::Address.city }
    address       { Faker::Address.street_name }
    building_name { 'あいうえおアイウエオ亜意于絵尾aioeoAIUEO123456789' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
    user_id       { Faker::Number.non_zero_digit }
    item_id       { Faker::Number.non_zero_digit }
  end
end
