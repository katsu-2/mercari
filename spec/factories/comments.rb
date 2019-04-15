FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    user { nil }
    item { nil }
  end
end
