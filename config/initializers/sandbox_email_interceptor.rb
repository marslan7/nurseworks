if Rails.env.development? || Rails.env.staging? || true
    ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end