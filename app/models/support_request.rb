class SupportRequest < ApplicationRecord
    belongs_to :user
    has_one_attached :supporting_doc

    has_rich_text :content

    
    TYPES = ["Time off notification",
    "Address and phone number changes",
    "Request for Tax 1099",
    "Request for wage verification",
    "Request for pay stub",
    "Request for CNA renewal form completion",
    "Notification of Material event or change in client",
    "Request for Name change",
    "Schedule of Admin Fees"]
end
