class AddSupportRequestTypeIntoSupportRequest < ActiveRecord::Migration[6.1]
  def change
    add_reference :support_requests, :support_request_type, null: false
  end
end
