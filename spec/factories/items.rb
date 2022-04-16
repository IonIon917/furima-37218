FactoryBot.define do
  factory :item do
    introduction            {Faker::Lorem.sentence}
    item_name               {Faker::Lorem.words}
    item_value              {Faker::Number.between(from: 300, to: 9999999)}
    category_id             {Faker::Number.between(from: 2, to: 11)}
    status_id               {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id      {Faker::Number.between(from: 2, to: 3)}
    ship_from_id            {Faker::Number.between(from: 1, to: 47)}
    days_to_ship_id         {Faker::Number.between(from: 2, to: 4)}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
