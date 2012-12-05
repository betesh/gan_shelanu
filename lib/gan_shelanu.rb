require "easy_rails_authentication"
require "compass-rails"
require "zurb-foundation"
require "gan_shelanu/simple_form"
require "gan_shelanu/engine"

module GanShelanu
  class Configuration
    attr_reader :recipient_emails
    attr_reader :additional_tabs
    def send_email_from_users_to staff
      @recipient_emails ||= []
      @recipient_names ||= []
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
      @additional_tabs ||= []
      tabs.each { |tab| @additional_tabs << tab }
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
