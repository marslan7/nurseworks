json.extract! user_doc, :id, :doc_type, :description, :user_id, :created_at, :updated_at
json.url user_doc_url(user_doc, format: :json)
