require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get hoge" do
    get :hoge
    assert_response :success
  end

end
