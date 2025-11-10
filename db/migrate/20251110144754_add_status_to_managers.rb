class AddStatusToManagers < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :status, :string, default: "Pendente"
  end
end
