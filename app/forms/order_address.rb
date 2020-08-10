class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :shipping_region_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_region_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11, message: 'is too long (maximum is 11 characters)' }
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Adress.create(item_id: item_id,
                  postal_code: postal_code,
                  shipping_region_id: shipping_region_id,
                  city: city,
                  house_number: house_number,
                  building_name: building_name,
                  phone_number: phone_number)
  end
end
