require "easy_rails_authentication"
require "compass-rails"
require "zurb-foundation"
require "numbers_and_words"
require "gan_shelanu/simple_form"
require "gan_shelanu/engine"

module GanShelanu
  STANDARD_CONTACT_US_FIELDS = [:email, :subject, :message]
  class Configuration
    attr_reader :recipient_emails
    attr_reader :additional_tabs
    attr_reader :contact_us_fields
    def initialize
      @recipient_emails ||= []
      @recipient_names ||= []
      @additional_tabs ||= []
      @contact_us_fields ||= STANDARD_CONTACT_US_FIELDS.dup
    end
    def send_email_from_users_to staff
      staff.each do |name, email|
        @recipient_emails.push("#{name} <#{email}>")
        @recipient_names.push(name)
      end
    end
    def recipient_names
      return @recipient_names[0] if 1 == @recipient_names.size
      result = @recipient_names.join(', ')
      *a, b = result.split(', ', -1)
      a.join(', ')+' and '+b
    end
    def add_tabs *tabs
      tabs.each { |tab| @additional_tabs << tab }
    end
    def add_contact_us_fields *fields
      fields.each { |f| @contact_us_fields << f }
    end
  end

  class << self
    def config
      @config ||= Configuration.new
    end
  end

  def self.configure
    yield self.config
  end
end
