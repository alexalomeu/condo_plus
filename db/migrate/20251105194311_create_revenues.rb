class CreateRevenues < ActiveRecord::Migration[5.2]
  def change
    create_table :revenues do |t|
      t.references :condominium, foreign_key: true
      t.string :unit
      t.string :tower
      t.decimal :negotiated_value, precision: 15, scale: 2
      t.decimal :monetization, precision: 15, scale: 2
      t.date :date

      t.timestamps
    end
  end
end