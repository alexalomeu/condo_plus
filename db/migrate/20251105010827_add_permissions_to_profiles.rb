class AddPermissionsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :permissions, :jsonb
  end
end
