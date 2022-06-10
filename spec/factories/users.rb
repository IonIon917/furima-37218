FactoryBot.define do
  factory :user do
    
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation   {password}
    last_name               {Gimei::last.kanji}
    first_name              {Gimei::first.kanji}
    first_name_kana         {Gimei::first.katakana}
    last_name_kana          {Gimei::last.katakana}
    birth_day               {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end
