class AddColumnDocumentTypInUserDocument < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_docs, :document_type, null: false
  end
end
