class AddEmergencyToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :emergency_contact_name, :string, limit: 60
    add_column :users, :emergency_contact_phone, :string, limit: 20
  end
end
