class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :categories, dependent: :destroy

  private

  def user_must_be_loja
    errors.add(:user, "User must be store") unless user.isLoja
  end
end
