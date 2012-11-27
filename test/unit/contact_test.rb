require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def self.requires_attribute attr
    test "should fail validation if missing #{attr}" do
      @contact.__send__("#{attr}=", nil)
      assert !@contact.save
      assert_only_error_is attr, "can't be blank"
    end
  end

  def self.test_invalid_email_format format
    test "email '#{format}' is invalid" do
      @contact.email = format
      assert !@contact.save
      assert_only_error_is :email, "does not appear to be valid"
    end
  end

  def assert_only_error_is attr, message
    assert_equal [attr], @contact.errors.messages.keys, @contact.errors.messages
    assert_equal [message], @contact.errors.messages[attr], @contact.errors.messages
  end

  Contact::ATTRIBUTES.each do |attr|
    requires_attribute attr
  end
  test_invalid_email_format "12345"
  test_invalid_email_format "abcdefg"

  test "child's age must be valid numerical" do
    @contact.child_age = "abc"
    assert !@contact.save
    assert_only_error_is :child_age, "is not a number"
  end

  test "valid contact" do
    assert_an_email_is_sent_when do
      assert @contact.save
    end

    expected = EmailFromUsers.contact_us(@contact).deliver
    assert_equal expected.from, @mail.from
    assert_equal expected.to, @mail.to
    assert_equal expected.reply_to, @mail.reply_to
    assert_equal expected.body.to_s, @mail.body.to_s
  end
end
