class EmailFromUsers < ActionMailer::Base
  default from: Proc.new { Rails.application.config.action_mailer.smtp_settings[:user_name] }
  default to: Proc.new { GanShelanu.config.recipient_emails }

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_from_users.contact_us.subject
  #
  def contact_us contact
    @contact = contact
    mail reply_to: @contact.email, subject: with_case_number(@contact.subject)
  end
private
  def with_case_number subject
    "Case ##{SecureRandom.hex(4)} - #{subject}"
  end
end
