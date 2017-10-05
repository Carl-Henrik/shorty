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
  # Checks to see that redirection to home/index works as intended.
  test "should create link" do
    assert_difference('Link.count') do
      post links_url, params: { link:{ url: @link.url } }
    end
    assert_redirected_to link_url(Link.last)
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

  # Tests short_redirect actions in links controller.
  # Sends get with url pattern matching existing url_short record.
  # Checks to see that redirection to intended url succeeds
  test "existing url_short should redirect to external url" do
    get "/exists"
    assert_redirected_to "http://www.bredband2.com"
  end

  # Tests short_redirect actions in links controller.
  # Sends get with url pattern matching no url_short record.
  # Checks to see that redirection to home/index succeeds
  test "non-existing url_short should redirect to root_path" do
    get "/doesntexist"
    assert_redirected_to root_path
  end

  # Sends get to search action in links controller with correct admin code in params hash
  # Asserts redirect to the link object to verify that the correct object was found
  test "should find link by correct admin code" do
    get search_links_url, params: { admin_code: @link.admin_code}
    assert_redirected_to @link
  end

  # Sends get to search action in links controller with incorrect admin code in params hash
  # Asserts redirect to links#new to verify that redirection was handled properly when link was not found.
  test "Search should redirect to root with incorrect admin code" do
    get search_links_url, params: { admin_code: "incorrect"}
    assert_redirected_to root_path
  end

end
