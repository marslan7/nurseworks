task update_types: :environment do

  support_request_types = SupportRequestType.pluck(:id, :name)
  support_request_types.each do |support_request_type|
    support_requests = SupportRequest.where(req_type: support_request_type[1])
    support_requests.update_all(support_request_type_id: support_request_type[0])
  end

  document_types = DocumentType.pluck(:id, :name)
  document_types.each do |document_type|
    user_docs = UserDoc.where(doc_type: document_type[1])
    user_docs.update_all(document_type_id: document_type[0])
  end
end
