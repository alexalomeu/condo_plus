class Responsible < ApplicationRecord
  belongs_to :real_estate

  validates :name, :email, presence: true
end