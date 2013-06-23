Clearance.configure do |config|
  config.mailer_sender = 'donotreply@example.com'
  config.password_strategy = Clearance::PasswordStrategies::SHA1
end
