require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  include Warden::Test::Helpers
  include Devise::Test::ControllerHelpers
  include FactoryGirl::Syntax::Methods
  
  test "should get home" do
    get :home
    assert_response :success
  end
end
