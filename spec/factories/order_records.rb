FactoryBot.define do
  factory :order_record do
    postal { '123-4567' }
    prefecture_id { 1 }
    municipalities { '東京都' }
    address { '1-1' }
    building { 'ハイツ' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
 