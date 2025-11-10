class Manager < ApplicationRecord
  belongs_to :condominium, class_name: "Condominium", foreign_key: "condominium_id"

  STATUSES = %w[Aprovado Pendente Rejeitado].freeze

  validates :name, :cpf, :email, :phone, presence: true
  validates :cpf, uniqueness: true

  # Campos que armazenam estruturas complexas
  serialize :selected_teams, Array
  store_accessor :week_schedule

end
