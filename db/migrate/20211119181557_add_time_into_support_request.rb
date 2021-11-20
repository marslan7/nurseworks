class AddTimeIntoSupportRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :support_requests, :start_date, :datetime
    add_column :support_requests, :end_date, :datetime
  end
end
