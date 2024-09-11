class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :categories, dependent: :destroy

  has_secure_password

  # validates :email, presence: true, uniqueness: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, uniqueness: true #, presence: true

end
