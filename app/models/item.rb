class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_regions
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    validates :image
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description
    validates :category
    validates :item_condition
    validates :delivery_fee
    validates :shipping_regions
    validates :shipping_days
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_condition_id
    validates :delivery_fee_id
    validates :shipping_region_id
    validates :shipping_days_id
  end
end
