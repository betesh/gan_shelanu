EasyRailsAuthentication.configure do |config|
  email = Rails.application.config.action_mailer.smtp_settings[:user_name]
  config.contact_info = email
  config.send_mail_from = email
  config.signature = "Gan Shelanu"
end

