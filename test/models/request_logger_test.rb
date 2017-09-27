require 'test_helper'

class RequestLoggerTest < ActiveSupport::TestCase
  # Sets up a hash with relevant accepted data simulating the env hash of a request
  def setup
      @env = {
      remote_host: "test",
      remote_addr: "127.0.0.1",
      http_user_agent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36",
      http_referer: "www.bredband2.com",
      request_uri: "\/test"
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
      @env[:remote_host] = nil
      @env[:request_uri] = nil
      RequestLogger.logg_request(@env)
    end
  end

  # Tests decoding of user_agent via the detect_user_agent method in RequestLogger
  # Saves request with known user_agent string and compares results in db against expected results
  test "Should detect user agent" do
    RequestLogger.logg_request(@env)
    v = Visit.find_by(remote_host: "test")
    assert_equal "Chrome", v.http_user_agent["browser"], 'Method returns incorrect browser'
    assert_equal "61.0.3163.100", v.http_user_agent["version"], 'Method returns incorrect version'
    assert_equal "Windows", v.http_user_agent["platform"], 'Method returns incorrect platform'
  end

end
