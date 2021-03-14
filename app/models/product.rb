class Product < ApplicationRecord

  with_options presence: true do
    validates :product
    validates :product_description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_time_id
    validates :price, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }, format: { with: /\A[0-9]+\z/ }
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
  belongs_to :time

  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :fee_id, numericality: { other_than: 1 } 
  validates :time_id, numericality: { other_than: 1 } 

end
