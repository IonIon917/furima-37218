FactoryBot.define do
  factory :address_purchase do
    post_code               {"123-4567"}
    ship_from_id            {Faker::Number.between(from: 1, to: 47)}
    city                    {Gimei::city.kanji}
    house_number            {"青山1-1-1"}
    building                {"柳ビル103"}
    tell                    {Faker::Number.leading_zero_number(digits: 11)}


    
    token                   {'tok_abcdefghijk00000000000000000'}

  end
end
