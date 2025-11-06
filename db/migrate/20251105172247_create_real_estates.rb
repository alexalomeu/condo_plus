class CreateRealEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :real_estates do |t|
      t.string :name
      t.string :cnpj
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
