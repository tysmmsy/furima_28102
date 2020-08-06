FactoryBot.define do
  factory :item do
    image                   { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/picture.png')) }
    name                    { 'yamada' }
    price                   { 1000 }
    description             { 'taro' }
    category_id             { 1 }
    item_condition_id       { 1 }
    delivery_fee_id         { 1 }
    shipping_region_id      { 1 }
    shipping_day_id         { 1 }
    association :user
  end
end
