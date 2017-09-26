require 'test_helper'

class RequestLoggerTest < ActiveSupport::TestCase
  # Sets up a hash with relevant accepted data simulating the env hash of a request
  def setup
      @env = {
      REMOTE_HOST: "test",
      REMOTE_ADDR: "127.0.0.1",
      HTTP_USER_AGENT: "chrome",
      HTTP_REFERER: "www.bredband2.com",
      REQUEST_URI: "/test"
      }
  end

  # Send hash to logg_request method in RequestLogger
  # Checks number of visits stored in db to verify that the record was saved.
  test "should save correct request to visits" do
    assert_difference('Visit.count') do
      RequestLogger.logg_request(@env)
    end
  end

  # Alters env hash to include nil values
  # Send env hash to logg_request method in RequestLogger
  # Checks number of visits stored in db to verify that the nil values were replaced and record was saved.
  test "should convert nil attributes before save" do
    assert_difference('Visit.count') do
      @env["REMOTE_HOST"] = nil
      @env["REQUEST_URI"] = nil
      RequestLogger.logg_request(@env)
    end
  end

end
