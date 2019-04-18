FactoryBot.define do

  factory :user do
    nickname              { Faker::Internet.user_name(1..20)}
    email                 { Faker::Internet.email }
    password = Faker::Internet.password(8)
    password              { password }
    password_confirmation { password }
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_kana           {Faker::Name.last_name}
    first_kana            {Faker::Name.first_name}
    created_at            { Faker::Time.between(DateTime.now - 1, DateTime.now)}
    updated_at            { Faker::Time.between(DateTime.now - 1, DateTime.now)}
  end

end
