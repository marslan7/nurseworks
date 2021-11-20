class DocumentType < ApplicationRecord
  has_many :assign_supporting_doc
  has_many :user_docs

  before_create :validate_sanitize

  validates :alias, uniqueness: true
  validates :name, uniqueness: true

  private
  def validate_sanitize
    self.name = name.strip
    self.alias = name.downcase.strip
  end
end
