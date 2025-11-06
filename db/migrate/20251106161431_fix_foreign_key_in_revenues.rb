class FixForeignKeyInRevenues < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :revenues, :condominia
    add_foreign_key :revenues, :condominiums
  end
end