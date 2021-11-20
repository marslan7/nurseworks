class DocumentType < ApplicationRecord
  has_many :assign_supporting_doc
  has_many :user_docs
end
