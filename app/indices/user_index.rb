ThinkingSphinx::Index.define :user, :with => :real_time do
    indexes first_name, :sortable => true
    indexes last_name, :sortable => true
    indexes email
    indexes phone
    
    has user_id , :type => :integer 
    has created_at, :type => :timestamp
    has updated_at, :type => :timestamp

end