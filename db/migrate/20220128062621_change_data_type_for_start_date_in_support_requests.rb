class ChangeDataTypeForStartDateInSupportRequests < ActiveRecord::Migration[6.1]
  def change
    change_column :support_requests, :start_date, :date
    change_column :support_requests, :end_date, :date
  end
end
