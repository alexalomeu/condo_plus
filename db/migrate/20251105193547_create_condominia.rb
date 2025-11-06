class CreateCondominia < ActiveRecord::Migration[5.2]
  def change
    create_table :condominia do |t|
      t.string :name
      t.references :real_estate, foreign_key: true

      t.timestamps
    end
  end
end
