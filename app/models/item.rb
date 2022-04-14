class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_charge
  belongs_to :ship_from
  belongs_to :status
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :introduction, presence: true
  validates :item_name, presence: true
  validates :item_value, presence: true, numericality: { in: 300..9999999 }
  validates :image, presence: true
end
