class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shopping_region_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_region_id, numericality: { other_than: 0, message: "Select" }
    validates :city, {message: "can't be blank"}
    validates :house_number, {message: "can't be blank"}
    validates :building_name, {message: "can't be blank"}
    validates :phone_number, {message: "can't be blank"}
  end

  def save
    item = Item.create
    Order.create(user_id: user_id, item: item_id)
    Address.create(item: item_id,
                   postal_code: postal_code, 
                   shipping_region: shipping_region_id, 
                   city: city, 
                   house_number: house_number, 
                   building_name: building_name, 
                   phone_number: phone_number
                  )
  end
   
end