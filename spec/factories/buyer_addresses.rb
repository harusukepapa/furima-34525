FactoryBot.define do
  factory :buyer_address do
    token                    {"tok_abcdefghijk00000000000000000"}
    postal_code              {"123-4567"}
    shipping_area_id         {1}
    city                     {"千葉県"}
    house_number             {"1-1-1"}
    building_name            {"千葉ハイツ"}
    phone_number             {"09012345678"}
  end
end
