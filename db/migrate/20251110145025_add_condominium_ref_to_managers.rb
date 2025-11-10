class AddCondominiumRefToManagers < ActiveRecord::Migration[5.2]
  def change
    add_reference :managers, :condominium, foreign_key: { to_table: :condominiums }
  end
end
