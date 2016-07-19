require 'test_helper'
require 'factory_girl_rails'

class ProductsControllerTest < ActionController::TestCase
include Warden::Test::Helpers
include Devise::Test::ControllerHelpers
 def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in users(:one)
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
