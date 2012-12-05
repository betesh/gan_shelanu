GanShelanu.configure do |config|
  domain = Rails.application.config.action_mailer.default_url_options[:host][4..-1]
  config.send_email_from_users_to "Miss Green"  => "miss.green@#{domain}",
                                  "Miss Brown"  => "miss.brown@#{domain}",
                                  "Miss Purple" => "miss.purple@#{domain}"
  config.add_tabs :whoWeAre, :mission
end
