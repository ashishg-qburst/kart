require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  include Warden::Test::Helpers
  include Devise::Test::ControllerHelpers
  
  test "should get create" do
    get :create
    assert_response :success
  end

end
