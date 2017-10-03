require 'test_helper'

class VisitsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:one)
  end

  test "should get index" do
    sign_in(@admin)
    get visits_url
    assert_redirected_to visits_path
  end

  test "should empty visits table" do
    sign_in(@admin)
  end

end
