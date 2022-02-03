class SupportRequestType < ApplicationRecord
  before_create :validate_sanitize
  before_destroy :can_destroy?

  has_many :support_requests, dependent: :destroy

  validates :name, uniqueness: true, presence: true


  private
  def validate_sanitize
    self.name = name.strip
    self.alias = name.downcase.strip
  end

  def can_destroy?
    if self.support_requests.present?
      self.errors.add(:base, "can't delete because support request exist agains this request type")
      throw :abort
    end
  end
end