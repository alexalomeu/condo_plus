class Manager < ApplicationRecord
  STATUSES = %w[Aprovado Pendente Rejeitado].freeze

  validates :name, :cpf, :email, :phone, presence: true
  validates :cpf, uniqueness: true
  validates :status, inclusion: { in: STATUSES }

  # se futuramente quiser associar ao Condominium model:
  # belongs_to :condominium, optional: true
end
