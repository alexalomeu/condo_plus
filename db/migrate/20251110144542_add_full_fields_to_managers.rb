class AddFullFieldsToManagers < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :condominium, :string
    add_column :managers, :gender, :string
    add_column :managers, :birth_date, :date
    add_column :managers, :marital_status, :string
    add_column :managers, :admission_date, :date
    add_column :managers, :contract_type, :string
    add_column :managers, :creci, :string
    add_column :managers, :address, :string
    add_column :managers, :neighborhood, :string
    add_column :managers, :city, :string
    add_column :managers, :number, :string
    add_column :managers, :zip_code, :string
    add_column :managers, :complement, :string
    add_column :managers, :courses, :string
    add_column :managers, :selected_teams, :text
    add_column :managers, :week_schedule, :jsonb
  end
end
