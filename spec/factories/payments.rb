FactoryBot.define do
  factory :payment do
    postal_code         {"123-4567"}
    prefecture_id       {"1"}
    city                {"札幌市"}
    address             {"札幌１−１−１"}
    phone               {"09022222222"}
    token               {"222xxxx123v26d"}
    association :user
    association :item
  end
end
  
