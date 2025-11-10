class RemoveCondominiumColumnFromManagers < ActiveRecord::Migration[5.2]
  def change
    remove_column :managers, :condominium, :string
  end
end
