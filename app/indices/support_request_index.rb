ThinkingSphinx::Index.define :support_request, :with => :active_record do
    indexes req_type, :sortable => true
    indexes user.first_name, :as => :first_name, :sortable => true
  
    has user_id, created_at, updated_at
end

