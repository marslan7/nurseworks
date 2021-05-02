class SupportRequest < ApplicationRecord
    
    ThinkingSphinx::Callbacks.append(
        self, :behaviours => [:real_time]
    )
    

    belongs_to :user
    has_one_attached :supporting_doc, dependent: :destroy

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


    after_save :send_notification

    def send_notification
        SupportRequestMailer.with(support_request: self).notification_email.deliver
    end

    def status
        self.closed ? "Closed" : "Open"
    end
end
