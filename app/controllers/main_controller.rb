class MainController < ApplicationController
  skip_before_filter :require_administrator_priveleges
  skip_before_filter :require_authentication

  def home
    @contact = Contact.new
  end

  def contact_us
    @contact = Contact.new(params[:contact])
    @contact.save
    respond_to do |format|
      format.js { render 'contact_us' }
      format.html { render 'home' }
    end
  end

  helper_method :contact_us_action, :contact_us_failure, :instance
private
  def contact_us_failure
    contact_us_action && @contact.invalid?
  end
  def contact_us_action
    :contact_us == action_name.to_sym
  end
  def instance
    @contact
  end
end
