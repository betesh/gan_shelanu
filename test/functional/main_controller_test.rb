require 'test_helper'

class MainControllerTest < ActionController::TestCase
  def contact_params
    result = {}
    GanShelanu.config.contact_us_fields.each { |k|
      result[k] = @contact.__send__(k)
    }
    result
  end
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contact_us" do
    post :contact_us, :contact => contact_params
    assert_response :success
  end
end
