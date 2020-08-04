FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname              { Faker::Lorem.sentence }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1991-04-10' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 4) + 'a1' }
    password_confirmation { password }
  end
end