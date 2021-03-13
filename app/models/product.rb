class Product < ApplicationRecord

  with_options presence: true do
    validates :product
    validates :product_description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_time_id
    validates :price
  end

  belongs_to :user
  has_one :purchases_record
  has_one_attached :image

end
