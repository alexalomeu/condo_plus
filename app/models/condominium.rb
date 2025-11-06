class Condominium < ApplicationRecord
  self.table_name = "condominiums"
  belongs_to :real_estate
  has_many :revenues
end
