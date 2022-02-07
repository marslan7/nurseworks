class AssignSupportRequest < ApplicationRecord
  belongs_to :user
  belongs_to :support_request
end
