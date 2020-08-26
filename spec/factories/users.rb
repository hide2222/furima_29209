FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}

    Faker::Config.locale = :ja
    family_name           {Faker::Name.name}
    first_name            {Faker::Name.name}
    birthday              {"1990-08-14"}
    family_name_kana      {"ホゲ"}
    first_name_kana       {"フガ"}
  end
    
end