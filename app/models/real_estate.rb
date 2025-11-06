class RealEstate < ApplicationRecord
  has_many :condominiums
  has_many :responsibles, dependent: :destroy
  accepts_nested_attributes_for :responsibles, allow_destroy: true, reject_if: :all_blank

  validates :name, :cnpj, presence: true

  def total_monetization
    10000 # valor fixo de exemplo
  end

  def pending_monetization
    2500 # outro valor fixo de exemplo, se quiser
  end
end