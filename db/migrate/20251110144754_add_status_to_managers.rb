class AddStatusToManagers < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :status, :string, default: "Pendente" unless column_exists?(:managers, :status)
  end
end
