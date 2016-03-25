require 'test_helper'

class InterfaceControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

end
