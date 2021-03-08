# DB 設計

## users table

| Column                   | Type           | Options           |
|--------------------------|----------------|-------------------|
| password                 | string         | null: false       |
| confirmation_password    | string         | null: false       |
| nickname                 | string         | null: false       |
| email                    | string         | unique: true      |
| last_name                | string         | null: false       |
| first_name               | string         | null: false       |
| last_name_kana           | string         | null: false       |
| first_name_kana          | string         | null: false       |
| birthday                 | date           | null: false       |

### Association

* has_many :product_information
* has_many :purchase_record


## products_information  table

| Column                   | Type           | Options           |
|--------------------------|----------------|-------------------|
| image                    | ActivesStorage | null: false       |
| product                  | string         | null: false       |
| product_description      | string         | null: false       |
| category                 | string         | null: false       |
| condition                | string         | null: false       |
| shipping_fee             | string         | null: false       |
| shipping_area            | string         | null: false       |
| shipping_time            | string         | null: false       |
| price                    | integer        | null: false       |
| user_id                  | references     | foreign_key: true |

### Association

* belongs_to :user
* has_one :purchase_record


## purchases_record  table

| Column                   | Type           | Options           |
|--------------------------|----------------|-------------------|
| buyer_id                 | references     | foreign_key: true |
| product_id               | references     | foreign_key: true |

### Association

* belongs_to :user
* belongs_to : products_information
* has_one :shipping_information


## shippings_information  table

| Column                   | Type           | Options           |
|--------------------------|----------------|-------------------|
| postal_code              | string         | null: false       |
| prefecture               | string         | null: false       |
| city                     | string         | null: false       |
| building                 | string         | null: false       |
| phone_number             | string         | null: false       |
| purchase_record_id       | references     | foreign_key: true |

### Association

* belongs_to :purchases_record



