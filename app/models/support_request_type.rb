class SupportRequestType < ApplicationRecord
  has_many :support_requests
  before_create :validate_sanitize

  validates :name, uniqueness: true


  private
  def validate_sanitize
    self.name = name.strip
    self.alias = name.downcase.strip
  end

end