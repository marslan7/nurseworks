class AssignSupportingDoc < ApplicationRecord
  belongs_to :user
  belongs_to :support_request
  #belongs_to :document_type
  belongs_to :super_admin, class_name: "User", foreign_key: 'user_id'

  validates_uniqueness_of :user_id, scope: :support_request # support request can not assign by same user twice

end
