class Condominium < ApplicationRecord
  self.table_name = "condominiums"
  belongs_to :real_estate
  has_many :revenues, dependent: :destroy
  has_many :managers, class_name: "Manager", foreign_key: "condominium_id"

end
