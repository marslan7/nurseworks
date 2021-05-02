class SupportRequestMailer < ApplicationMailer
    def notification_email
        @support_request = params[:support_request]
        mail(   to: @support_request.user.email, 
                cc: ENV['SUPPORT_EMAIL'],
                subject: "Notification: Request #{@support_request.id} - #{@support_request.status}")
    end
end
