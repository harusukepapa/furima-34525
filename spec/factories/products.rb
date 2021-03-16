FactoryBot.define do
  factory :product do
    product                  {"koara"}
    product_description      {"aaa"}
    category_id              {2}
    condition_id             {2}
    shipping_fee_id          {2}
    shipping_area_id         {1}
    shipping_time_id         {2}
    price                    {300}

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user

  end

end
