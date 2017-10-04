require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:one)
  end

  test "should redirect to index after sign in" do
    sign_in(@admin)
    assert_redirected_to controller: "visits", action: "index"
  end
end
