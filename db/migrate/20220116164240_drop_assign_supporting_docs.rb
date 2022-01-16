class DropAssignSupportingDocs < ActiveRecord::Migration[6.1]
  def change
    drop_table :assign_supporting_docs
  end
end
