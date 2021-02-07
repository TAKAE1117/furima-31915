# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| last_name_kanji  | string  | null: false |
| first_name_kanji | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday_year    | integer | null: false |
| birthday_month   | integer | null: false |
| birthday_day     | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type           | Options     |
| ----------- | -------------- | ----------- |
| image       | Active Storage |             |
| title       | text           | null: false |
| description | text           | null: false |
| category    | text           | null: false |
| state       | text           | null: false |
| fee         | text           | null: false |
| area        | text           | null: false |
| days        | text           | null: false |
| price       | text           | null: false |
| user        | references     |             |

### Association

- belongs_to :user
- has_one :address
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

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | text    | null: false |
| prefectures   | text    | null: false |
| municipality  | text    | null: false |
| address       | text    | null: false |
| building_name | text    |             |
| phone_number  | integer | null: false |

### Association

- belongs_to :item
- belongs_to :purchase