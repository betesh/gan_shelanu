class MainController < ApplicationController
  skip_before_filter :require_administrator_priveleges
  skip_before_filter :require_authentication

  def home
  end

  def contact_us
  end
end
