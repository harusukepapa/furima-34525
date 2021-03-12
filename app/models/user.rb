class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  

  # アソシエーション
  has_many :products
  has_many :purchases_records

end
