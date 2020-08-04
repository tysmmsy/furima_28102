class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,              null: false,  foreign_key: true
      t.string  :name,                 null: false
      t.string  :description,          null: false
      t.integer :price,                null: false
      t.integer :item_image_id,        null: false
      t.integer :item_condition_id,    null: false
      t.integer :delivery_fee_id,      null: false
      t.integer :shipping_regions_id,  null: false
      t.integer :shipping_days_id,     null: false
      t.timestamps
    end
  end
end
