class EmailFromUsers < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_from_users.contact_us.subject
  #
  def contact_us contact
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
