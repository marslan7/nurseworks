class DropTableAssignSupReq < ActiveRecord::Migration[6.1]
  def change
    drop_table :assign_support_requests
  end
end
