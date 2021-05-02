
ThinkingSphinx::Index.define :user_doc, :with => :real_time do
    indexes doc_type, :sortable => true
    indexes description
    indexes user.first_name, :as => :first_name, :sortable => true
  
    has user_id , :type => :integer 
    has created_at, :type => :timestamp
    has updated_at, :type => :timestamp

end