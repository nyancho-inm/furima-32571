FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials }
    email                  { Faker::Internet.free_email }
    password               { "aaaa1111" }
    password_confirmation  { password }
    first_name             { Gimei.first.kanji }
    first_name_kana        { Gimei.first.katakana }
    last_name              { Gimei.last.kanji }
    last_name_kana         { Gimei.last.katakana }
    birthday               { Faker::Date.birthday }
  end
end
