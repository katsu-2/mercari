FactoryBot.define do

  factory :item do
    name                  { Faker::Name.name }
    price                 { Faker::Number.within(300..9999999) }
    description           { Faker::Lorem.sentences }
    size                  { Faker::Number.within(0..10) }
    status                { Faker::Number.within(0..3) }
    condition             { Faker::Number.within(0..5) }
    delivery_fee          { Faker::Number.within(0..1) }
    delivery_way          { Faker::Number.within(0..8) }
    delivery_date         { Faker::Number.within(0..2) }
    delivery_area         { Faker::Number.within(1..47) }
    created_at            { Faker::Time.between(DateTime.now - 1, DateTime.now)}
    updated_at            { Faker::Time.between(DateTime.now - 1, DateTime.now)}
    user
  end

end
