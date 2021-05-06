class AddUpdatedByToSupportRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :support_requests, :updated_by_id, :integer
    add_index :support_requests, :updated_by_id
  end
end
