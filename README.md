# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| last_name_kanji    | string  | null: false |
| first_name_kanji   | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | data    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| title        | string     | null: false       |
| description  | text       | null: false       |
| category _id | integer    | null: false       |
| state_id     | integer    | null: false       |
| fee_id       | integer    | null: false       |
| area_id      | integer    | null: false       |
| day_id       | integer    | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key :true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| address       | string     | null: false       | 
| building_name | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to :purchase