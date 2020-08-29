FactoryBot.define do
  factory :item do
    name                  {Faker::Name.name}
    item_detail           {Faker::Name.name}
    price                 {2222}
    category_id           {1}
    status_id             {1}
    ship_fee_id           {1}
    prefecture_id         {1}
    ship_schedule_id      {1}
  
    user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample1.png'),filename: 'sample1.png', content_type: 'image/png')
    end
  end
end


    