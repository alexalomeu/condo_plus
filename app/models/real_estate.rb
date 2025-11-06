class RealEstate < ApplicationRecord
  has_many :condominiums
  has_many :responsibles, dependent: :destroy
  accepts_nested_attributes_for :responsibles, allow_destroy: true, reject_if: :all_blank

  validates :name, :cnpj, presence: true

  # Soma total de monetização (todas as receitas dos condomínios)
  def total_monetization
    condominiums.joins(:revenues).sum("revenues.monetization")
  end

  # Soma total de valores negociados
  def total_negotiated
    condominiums.joins(:revenues).sum("revenues.negotiated_value")
  end

  # Exemplo de cálculo de monetização pendente
  # (ajuste conforme tua lógica real — aqui é só um exemplo)
  def pending_monetization
    total_negotiated - total_monetization
  end
end
