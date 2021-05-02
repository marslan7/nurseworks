class SupportRequestMailer < ApplicationMailer
    def notification_email
        @support_request = SupportRequest.first
        mail(to: @support_request.user.email, subject: 'Support Request Notification')
    end
end
