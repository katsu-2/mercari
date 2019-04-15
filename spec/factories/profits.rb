FactoryBot.define do
  factory :profit do
    profit { 1 }
    profit_log { "MyString" }
    expiration_date { "" }
    user { nil }
    item { nil }
  end
end
