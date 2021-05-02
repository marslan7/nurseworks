
ThinkingSphinx::Index.define :user_doc, :with => :active_record do
    indexes doc_type, :sortable => true
    indexes description
    indexes user.first_name, :as => :first_name, :sortable => true
  
    has user_id, created_at, updated_at
end