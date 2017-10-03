require 'test_helper'

class VisitsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:one)
  end

  # signs in since controller is restricted
  # asserts response
  test "should get index" do
    sign_in(@admin)
    get visits_url
    assert_response :success
  end
  # signs in since controller is restricted
  # calls empty_logg in visits controller
  # confirms that the visits table is empty
  test "should empty visits table" do
    sign_in(@admin)
    get empty_logg_visits_path
    assert_equal [], Visit.all
  end

end
