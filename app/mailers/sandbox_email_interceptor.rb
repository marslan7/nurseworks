class SandboxEmailInterceptor
    def self.delivering_email(message)
      if !( ['production', 'staging'].include?(Rails.env) )
        message.to = ['support@caremountain.com','thimmaiah@gmail.com', 'gagan.bhalla@gmail.com'] 
      else
        message.bcc = ['support@caremountain.com']
      end
    end
end