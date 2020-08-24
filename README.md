#テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| -----------------------| ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| password_confirmation  | string | null: false |
| family_name            | string | null: false |
| first_name             | string | null: false |
| family_name_kana       | string | null: false |
| first_name_kana        | string | null: false |
| birthday_id            | integer| null: false |

### Association

- has_many :items
- has_one :item, through: :user_item
- belongs_to_active_hash :birthday

## items テーブル

| Column          | Type   | Options                        |
| --------------- | ------ | ------------------------------ |
| name            | string | null: false                    |
| item_detail     | text   | null: false                    |
| price           | integer| null: false                    |
| category1_id    | integer| null: false                    |
| category2_id    | integer| null: false                    |
| ship_fee_id     | integer| null: false                    |
| prefecture_id   | integer| null: false, foreign_key: true | 
| ship_schedule_id| integer| null: false                    |


### Association

- belongs_to :user
- has_one_attached :image
- belongs_to_active_hash :category1
- belongs_to_active_hash :category2
- belongs_to_active_hash :ship_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :ship_schedule
- has_one :user, through: :user_item

## user_item テーブル

| Column       | Type   | Options                        |
| ------------ | ------ | ------------------------------ |
| user_id      | string | null: false, foreign_key: true |
| item_id      | string | null: false, foreign_key: true |
| postal_code  | integer| null: false                    |
| prefecture_id| integer| null: false, foreign_key: true |                    |
| city         | string | null: false                    |
| address      | string | null: false                    |
| phone        | string | null: false                    | 


### Association

- belongs_to :item 
- belongs_to :user
- belongs_to_active_hash :prefecture
