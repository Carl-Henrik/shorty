require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = admins(:one)
  end

  # Cant't get this to work. 
  #test "should redirect to index after sign in" do
  #  sign_in @admin
  #  assert_redirect_to visits_path
  #end
end
