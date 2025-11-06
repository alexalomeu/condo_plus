class AddResponsibleToRealEstates < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates, :responsible_name, :string
    add_column :real_estates, :responsible_phone, :string
    add_column :real_estates, :responsible_email, :string
  end
end
