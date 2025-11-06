class AddFieldsToRealEstates < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates, :contact, :string
    add_column :real_estates, :website, :string
    add_column :real_estates, :logo, :string
  end
end
