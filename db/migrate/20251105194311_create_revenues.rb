class CreateRevenues < ActiveRecord::Migration[5.2]
  def change
    create_table :revenues do |t|
      t.references :real_estate, foreign_key: true
      t.references :condominium, foreign_key: true
      t.string :unit
      t.decimal :negotiated_value
      t.decimal :monetization
      t.date :date

      t.timestamps
    end
  end
end
