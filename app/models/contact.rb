require 'validates_email_format_of'

class Contact
  include ActiveModel::Conversion
  include ActiveModel::Validations

  GanShelanu.config.contact_us_fields.each do |attr|
    attr_accessor attr
    validates attr, presence: true
  end

  validates_email_format_of :email, allow_nil: true
  validates_numericality_of :child_age, greater_then_or_equal_to: 0, allow_nil: true

  def initialize(attributes = {})
    attributes.each do |key, val|
      self.send("#{key}=", val)
    end
  end

  def save
    if self.invalid?
      self.errors.delete(:email) if self.errors[:email].empty? # Workaround for https://github.com/alexdunae/validates_email_format_of/issues/25
      return false
    end
    EmailFromUsers.contact_us(self).deliver
    true
  end
  
  def persisted?
    false
  end
end
