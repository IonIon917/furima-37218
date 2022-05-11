class AddressPurchase

  include ActiveModel::Model
  

  
  attr_accessor :post_code, :ship_from_id, :city, :building, :tell, :house_number, :user_id, :item_id

  

  with_options presence: true do
    validates :ship_from_id, numericality: { other_than: 0 , message: "can't be blank"} 
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, ship_from_id: ship_from_id, city: city, building: building, tell: tell, house_number: house_number, purchase_id: purchase.id)
  end
end
