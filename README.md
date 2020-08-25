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
| birthday_id            | date   | null: false |

### Association

- has_many :items
- has_many :user_items

## items テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| user            | references| null: false, foreign_key: true |
| name            | string    | null: false                    |
| item_detail     | text      | null: false                    |
| price           | integer   | null: false                    |
| category_id     | integer   | null: false                    |
| status_id       | integer   | null: false                    |
| ship_fee_id     | integer   | null: false                    |
| prefecture_id   | integer   | null: false                    | 
| ship_schedule_id| integer   | null: false                    |


### Association

- belongs_to :user
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :ship_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :ship_schedule
- has_one :user_items

## user_items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


### Association

- belongs_to :item 
- belongs_to :user
- has_one :user_address

## user_address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_item    | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building_name| string     |                                |
| phone        | string     | null: false                    | 



### Association

- belongs_to :user_item
- belongs_to_active_hash :prefecture