class AddStatusToCondominiums < ActiveRecord::Migration[5.2]
  def change
    add_column :condominiums, :status, :string, default: "Pendente"
  end
end