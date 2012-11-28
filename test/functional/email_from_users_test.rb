require 'test_helper'

class EmailFromUsersTest < ActionMailer::TestCase
  def set_expectations
    @expected_domain = "___EDIT_ME_IN_config/application.rb___.com"
    @expected_subject = /Case #[A-Za-z0-9]{8} - Please tell me more about your Gan/
    @expected_to = ["miss.green@#{@expected_domain}", "miss.brown@#{@expected_domain}", "miss.purple@#{@expected_domain}"]
    @expected_from = ["contact_us@#{@expected_domain}"]
    @expected_greeting = "Hi, Miss Green, Miss Brown and Miss Purple\!"
    @expected_intro = "Potential Parent, who lives in Beit Jala and has a 1\.5-year-old named Little One, has sent you the following message"
  end

  def assert_email_contains content
    assert_match /^#{content}/, @body
  end

  test "contact_us" do
    set_expectations
    mail = EmailFromUsers.contact_us @contact
    assert_match @expected_subject, mail.subject
    assert_equal @expected_to, mail.to
    assert_equal @expected_from, mail.from
    @body = mail.body.encoded
    assert_email_contains @expected_greeting
    assert_email_contains @expected_header
    assert_email_contains @contact.message
  end
end
