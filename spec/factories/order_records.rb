FactoryBot.define do
  factory :order_record do
    user_id { 1 }
    item_id { 1 }
    #record_id { 1 }
    postal { '123-4567' }
    prefecture_id { 1 }
    municipalities { '東京都' }
    address { '1-1' }
    building { 'ハイツ' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
 