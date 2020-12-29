FactoryBot.define do
  factory :item do
    item_name {"商品" }
    description {"悪く無い"}
    category_id {2}
    condition_id {2}
    fee_id {2}
    area_id {2}
    day_id {2}
    price {10000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
