
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| confirm_password | string | null:false |
| last_name  | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null:false |

### Association

- has_many :items
- has_many :item_purchases
- has_many :comments
- has_one :address

## address テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| postal_code | integer | null:false |
| prefecture | integer | null:false, foreign_key: true |
| city | string | null:false |
| house_number | string | null:false |
| building_name | string |
| phone_number | integer | null:false |

### Association
- belongs_to :user

## items テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| name | string | null: false |
| description | text | null: false |
| price | integer | null:false |
| category_id | integer | null:false, foreign_key: true |
| item_condition_id | integer | null:false, foreign_key: true |
| delivery_fee_id | integer | null:false, foreign_key: true |
| shipping_regions_id | integer | null:false, foreign_key: true |
| shipping_days_id | integer | null:false, foreign_key: true |
| item_image_id | integer | null: false, foreign_key: true |


### Association

- has_many :item_images
- has_many :comments
- has_one  :item_purchases
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :shopping_regions
- belongs_to_active_hash :shipping_days

## item_images テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| url | string | null:false |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## comments テーブル(中間テーブル)

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| comment | text | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## item_purchases テーブル

| Column  | Type    | Options                        |
| ------- |  ------- | ------------------------------ |
| user | references | null:false, foreign_key: true |
| item | references | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user