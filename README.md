
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :comments
- has_many :items
- has_one :profile

## profile テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| last_name  | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_year | integer | null: false |
| birth_month | integer | null:false |
| birth_day | integer | null:false

### Association

- belongs_to :user

## items テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| name | string | null: false |
| description | text | null: false |
| price | integer | null:false |
| category_id | references | null:false |
| item_condition_id | references | null:false |
| delivery_fee_id | references | null:false |
| shipping_regions_id | references | null:false |
| shipping_days_id | references | null:false |
| item_image_id | references | null: false, foreign_key: true |


### Association
- has_many :item_images
- has_many :comments
- has_one 
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
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## comments テーブル(中間テーブル)

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| comment | text | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## category テーブル(active_hash)

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| category | string | null:false |

### Association

- has_many :items

## item_condition テーブル(active_hash)

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item_condition | string | null:false |

### Association

- has_many :items

## delivery_fee テーブル(active_hash)

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| delivery_fee | string | null:false |

### Association
- has_many :items

## shipping_regions テーブル(active_hash)

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| shipping_regions | string | null:false |

### Association
- has_many :items

## shipping_days テーブル(active_hash)

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| shipping_days | string | null:false |

### Association
- has_many :items

## transactions テーブル

| Column  | Type    | Options                        |
| ------- |  ------- | ------------------------------ |
| card_number    | integer  | null:false |
| expiration_year | integer | null: false |
| expiration_month | integer | null: false |
| security_code | integer | null:false |
| postal_code | integer | null:false |
| prefecture | string | null:false |
| city | string | null:false |
| house_number | string | null:false |
| building_name | string |
| phone_number | integer | null:false |

### Association

- belongs_to :item