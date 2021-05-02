class CreateSupportRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :support_requests do |t|
      t.string :req_type, limit: 50
      t.text :details
      t.integer :user_id

      t.timestamps
    end
    add_index :support_requests, :user_id, unique: false
  end
end
