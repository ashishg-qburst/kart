require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
include Warden::Test::Helpers
include Devise::Test::ControllerHelpers
 def setup
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
