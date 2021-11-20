class AddDocumentTypeIntoAssignSupportingDoc < ActiveRecord::Migration[6.1]
  def change
    add_reference :assign_supporting_docs, :document_type, null: false
  end
end
