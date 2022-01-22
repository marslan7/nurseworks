class AssignSuppRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :assign_support_requests do |t|
      t.references :user
      t.references :support_request

      t.timestamps
    end
  end
end
