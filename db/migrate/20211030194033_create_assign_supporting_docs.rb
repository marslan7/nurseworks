class CreateAssignSupportingDocs < ActiveRecord::Migration[6.1]
  def change
    create_table :assign_supporting_docs do |t|
      t.references :user, null: false
      t.references :support_request, null: false
      t.references :super_admin, null: false

      t.timestamps
    end
  end
end
