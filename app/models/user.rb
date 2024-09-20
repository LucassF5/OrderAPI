class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :categories, dependent: :destroy

  has_secure_password

  validates :username, presence: true, length: { in: 3..40 } #, uniqueness: false
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 6..20 }
  validates :phone_number, presence: true, length: { is: 11 }, numericality: { only_integer: true }

end
