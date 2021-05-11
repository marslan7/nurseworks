class SandboxEmailInterceptor
    def self.delivering_email(message)
      message.to = ['support@caremountain.com','thimmaiah@gmail.com', 'gagan.bhalla@gmail.com'] unless ['production', 'staging'].include?(Rails.env)
    else
      message.bcc = ['support@caremountain.com']
    end
end