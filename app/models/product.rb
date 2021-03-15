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
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }, format: { with: /\A[0-9]+\z/ }
  end


  belongs_to :user
  has_one :purchases_record
  has_one_attached :image

  #ActiveHashのアソシエーション・バリデーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :shipping_time
  #ActiveHashのアソシエーション・バリデーション
  

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 0 } 
  validates :shipping_fee_id, numericality: { other_than: 1 } 
  validates :shipping_time_id, numericality: { other_than: 1 } 

  
  
  def was_attached?
    self.image.attached?
  end

end
