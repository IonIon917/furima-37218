class AddressPurchase

  include ActiveModel::Model
  

  
  attr_accessor :post_code, :ship_from_id, :city, :building, :tell, :house_number, :user_id, :item_id, :token
  

  

  with_options presence: true do
    validates :ship_from_id, numericality: { other_than: 0 , message: "can't be blank"} 
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :tell, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
    validates :house_number
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, ship_from_id: ship_from_id, city: city, building: building, tell: tell, house_number: house_number, purchase_id: purchase.id)
  end
end
