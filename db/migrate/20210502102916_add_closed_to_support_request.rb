class AddClosedToSupportRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :support_requests, :closed, :boolean
  end
end
