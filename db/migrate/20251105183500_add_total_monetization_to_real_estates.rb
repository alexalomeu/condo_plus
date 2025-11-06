class AddTotalMonetizationToRealEstates < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates, :total_monetization, :decimal
  end
end
