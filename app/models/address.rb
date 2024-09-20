class Address < ApplicationRecord
  before_save :buscar_cep
  belongs_to :user

  validates :cep, presence: true

  private

  def seaarch_address_by_cep
    return if cep.blank? # Se o cep estiver vazio vai retornar nil

    
  end

end
