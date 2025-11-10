class RenameCondominiaToCondominiums < ActiveRecord::Migration[5.2]
  def change
   drop_table :condominia
  end
end
