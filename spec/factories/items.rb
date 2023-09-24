FactoryBot.define do
  factory :item do
    name               {'test'}
    description        {'test'}
    category_id        {2}
    condition_id       {2}
    delivery_charge_id {2}
    prefecture_id      {2}
    shipping_time_id   {2}
    price              {500}
  end
end
