FactoryBot.define do
  factory :purchase_address do
    token         { "tok_0000000000000000000000000000" }
    postal_code   { '123-4567' }
    prefecture_id { "2" }
    city          { '富山市' }
    address       { '富山1-1' }
    building_name { 'トヤマ' }
    tel_number    { '09012345678' }
  end
end
