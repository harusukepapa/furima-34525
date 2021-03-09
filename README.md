# DB 設計

## users  table

| Column                   | Type           | Options                   |
|--------------------------|----------------|---------------------------|
| encrypted_password       | string         | null: false               |
| nickname                 | string         | null: false               |
| email                    | string         | null: false, unique: true |
| last_name                | string         | null: false               |
| first_name               | string         | null: false               |
| last_name_kana           | string         | null: false               |
| first_name_kana          | string         | null: false               |
| birthday                 | date           | null: false               |

### Association

* has_many :products
* has_many :purchases_records


## products  table

| Column                      | Type           | Options           |
|-----------------------------|----------------|-------------------|
| product                     | string         | null: false       |
| product_description         | text           | null: false       |
| category_id                 | integer        | null: false       |
| condition_id                | integer        | null: false       |
| shipping_fee_id             | integer        | null: false       |
| shipping_area_id            | integer        | null: false       |
| shipping_time_id            | integer        | null: false       |
| price                       | integer        | null: false       |
| user                        | references     | foreign_key: true |

### Association

* belongs_to :user
* has_one :purchases_record


## purchases_records  table

| Column                   | Type           | Options           |
|--------------------------|----------------|-------------------|
| user                     | references     | foreign_key: true |
| product                  | references     | foreign_key: true |

### Association

* belongs_to :user
* belongs_to :product
* has_one :delivery


## deliveries  table

| Column                   | Type           | Options           |
|--------------------------|----------------|-------------------|
| postal_code              | string         | null: false       |
| shipping_area_id         | integer        | null: false       |
| address                  | string         | null: false       |
| city                     | string         | null: false       |
| building                 | string         |                   |
| phone_number             | string         | null: false       |
| purchase_record          | references     | foreign_key: true |

### Association

* belongs_to :purchases_record



