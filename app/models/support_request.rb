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
    "Schedule of Admin Fees",
    "Other"]


    scope :open, -> { where("closed = 0") }
    scope :closed, -> { where("closed = 1") }

    before_create :init_defaults
    after_save :send_notification

    def send_notification
        SupportRequestMailer.with(support_request: self).notification_email.deliver_later
    end

    def status
        self.closed ? "Completed" : "Open"
    end

    def init_defaults
        self.closed = false if self.closed == nil
    end
end
