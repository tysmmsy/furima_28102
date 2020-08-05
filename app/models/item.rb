class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition, :delivery_fee, :shipping_regions, :shipping_days

  with_options presence: true do
    validates :user_id, :name, :description, :price
    validates :category_id, :item_condition_id, :delivery_fee_id, :shipping_regions_id, :shipping_days_id numericality: { other_than: 1 } 
    validates :price_range_valid?
  end

  def price_range_valid?
    if price < 300 || price > 9999999
      errors.add(:price, "価格設定を変えてください")
    end
  end
end
