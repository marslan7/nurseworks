class CreateSupportRequestTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :support_request_types do |t|
      t.string :name
      t.string :alias

      t.timestamps
    end
  end
end
