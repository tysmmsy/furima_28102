class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition, :delivery_fee, :shipping_regions

  validates :category_id, :item_condition_id, :delivery_fee_id, :shipping_regions_id numericality: { other_than: 1 } 
end
