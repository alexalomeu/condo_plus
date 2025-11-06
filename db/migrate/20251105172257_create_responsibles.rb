class CreateResponsibles < ActiveRecord::Migration[5.2]
  def change
    create_table :responsibles do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :position
      t.references :real_estate, foreign_key: true

      t.timestamps
    end
  end
end
