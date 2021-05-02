ThinkingSphinx::Index.define :support_request, :with => :real_time do
    indexes req_type, :sortable => true
    indexes user.first_name, :as => :first_name, :sortable => true
  
    has user_id , :type => :integer 
    has created_at, :type => :timestamp
    has updated_at, :type => :timestamp
end

