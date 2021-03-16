class Product < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :product
    validates :product_description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_time_id
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  end


  belongs_to :user
  has_one :purchases_record
  has_one_attached :image

  #ActiveHashのアソシエーション・バリデーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :shipping_time
  #ActiveHashのアソシエーション・バリデーション
  
  validates :shipping_area_id, numericality: { other_than: 0 }
  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :condition_id
  validates :shipping_fee_id 
  validates :shipping_time_id
  end
  
  
  def was_attached?
    self.image.attached?
  end

end
