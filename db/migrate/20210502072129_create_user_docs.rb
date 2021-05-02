class CreateUserDocs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_docs do |t|
      t.string :doc_type, limit: 50
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :user_docs, :user_id, unique: false

  end
end
