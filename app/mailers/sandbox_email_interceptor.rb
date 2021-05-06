class SandboxEmailInterceptor
    def self.delivering_email(message)
      message.to = ['support@nurseworks.com']
    end
end