class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :birth_day, presence: true
  validates :password, length: { minimum: 6 },
                       format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: " is invalid. Include both letters and numbers"}

  has_many :items
  has_many :purchases
end
