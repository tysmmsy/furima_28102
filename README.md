# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| name              | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| confirm_password  | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## addresses テーブル

| Column             | Type    | Options    |
| ------------------ | ------- | ---------- |
| postal_code        | string  | null:false |
| shipping_region_id | integer | null:false |
| city               | string  | null:false |
| house_number       | string  | null:false |
| building_name      | string  |
| phone_number       | string  | null:false |

### Association
- belongs_to :item
- belongs_to_active_hash :shipping_region

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| description        | text    | null: false |
| price              | integer | null: false |
| category_id        | integer | null: false |
| item_condition_id  | integer | null: false |
| delivery_fee_id    | integer | null: false |
| shipping_region_id | integer | null: false |
| shipping_day_id    | integer | null: false |


### Association

- belongs_to :user
- has_many :comments
- has_one :order
- has_one :address
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :shopping_region
- belongs_to_active_hash :shipping_day

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user