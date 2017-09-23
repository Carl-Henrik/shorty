require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest

  # Creates a link object from fixtures file links.yml
  setup do
    @link = links(:one)
  end

  # Sends a get to links controller and evaluates the response
  test "should get new" do
    get new_link_url
    assert_response :success
  end

  # Sends a post to links controller with link object attributes in params hash
  # Checks link count to se if theres been a new link saved.
  # Checks to see that redirection to home#index works as intended.
  test "should create link" do
    assert_difference('Link.count') do
      post links_url, params: { link: { url: @link.url } }
    end
    assert_redirected_to root_path
  end

  # Sends delete to links controller
  # Checks link count to se if theres less entrys after action.
  # Checks to see that redirection to home#index works as intended.
  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete link_url(@link)
    end
    assert_redirected_to root_path
  end
end
