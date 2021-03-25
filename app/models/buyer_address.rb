class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :user_id, :product_id, :token


  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/} 
    validates :user_id
    validates :product_id
  end
    validates :shipping_area_id, numericality: { other_than: 0 }

  def save
    buyer = Buyer.create(user_id: user_id, product_id: product_id )
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id )
  end



end