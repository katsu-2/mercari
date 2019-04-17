FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "nickname#{n}" }
    sequence(:email)    { |n| "tester#{n}@example.com" }
    password            { "foobar" }
    password_confirmation { "foobar" }
    family_name         { "山田" }
    first_name          { "太郎" }
    family_kana         { "yamada" }
    first_kana          { "taro" }
  end
end
