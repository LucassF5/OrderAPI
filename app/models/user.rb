class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :store, dependent: :destroy

  has_secure_password

  validates :username, :email, :password, presence: true
  validates :username, length: { in: 3..40 } , uniqueness: false
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, length: { in: 6..20 }#, on: :create
  validates :phone_number, length: { is: 11 }, numericality: { only_integer: true }
  validates :isLoja, inclusion: { in: [true, false] }
end
