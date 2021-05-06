class SandboxEmailInterceptor
    def self.delivering_email(message)
      message.to = ['support@caremountain.com','thimmaiah@gmail.com', 'gagan.bhalla@gmail.com']
    end
end