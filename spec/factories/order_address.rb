FactoryBot.define do
  factory :order_address do
    postal_code { "123-4567" }
    shipping_region_id { 1 }
    city { "横浜" }
    house_number { "青山" }
    building_name { "柳ビル" }
    phone_number { "09012345678" }
  end
end