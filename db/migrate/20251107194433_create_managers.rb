class CreateManagers < ActiveRecord::Migration[5.2]
 def change
    create_table :managers do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :condominium
      t.string :status, default: "Pendente"

      t.timestamps
    end

    add_index :managers, :cpf, unique: true
    add_index :managers, :email
  end
end
