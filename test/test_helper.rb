# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

class ActiveSupport::TestCase
  def assert_an_email_is_sent_when &block
    assert_difference 'ActionMailer::Base.deliveries.size' do
      yield
    end
    @mail = ActionMailer::Base.deliveries.last
  end
  def attributes
    {
      email: 'gan@shelanu.sy',
      name: 'Potential Parent',
      child_name: 'Little One',
      child_age: '1.5',
      subject: 'Please tell me more about your Gan',
      neighborhood: 'Beit Jala',
      message: "This text as a string is being compared to itself as a regex so it cant bracket sic bracket include any characters that must be escaped in ruby regexs"
    }
  end
  setup do
    @contact = Contact.new(attributes)
  end
end
