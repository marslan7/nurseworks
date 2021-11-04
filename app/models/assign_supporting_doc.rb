class AssignSupportingDoc < ApplicationRecord
  belongs_to :user
  belongs_to :support_request
  belongs_to :super_admin, class_name: "User", foreign_key: 'user_id'

  # validates :super_admin_id,  uniqueness: { scope: [:user_id]} #same user can not assign by admin twice with same support_request
  # validates_uniqueness_of :super_admin_id, scope: :user_id

end
