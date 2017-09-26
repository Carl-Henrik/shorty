require 'test_helper'

class RequestLoggerTest < ActiveSupport::TestCase
  # Sets up a controller request objects env hash with relevant accepted data.
  def setup
    controller.request.env.assign_attributes({
      REMOTE_HOST: "test",
      REMOTE_ADDR: "127.0.0.1",
      HTTP_USER_AGENT: "chrome",
      HTTP_REFERER: "www.bredband2.com",
      REQUEST_URI: "/test"]
      })
  end

  # Send env hash to logg_request method in RequestLogger
  # Checks number of visits stored in db to verify that the record was saved.
  test "should save correct request to visits" do
    assert_difference('Visit.count') do
      RequestLogger.logg_request(controller.request.env)
    end
  end

  # Alters env hash to include nil values
  # Send env hash to logg_request method in RequestLogger
  # Checks number of visits stored in db to verify that the nil values were replaced and record was saved.
  test "should convert nil attributes before save" do
    assert_difference('Visit.count') do
      controller.request.env["REMOTE_HOST"] = nil
      controller.request.env["REQUEST_URI"] = nil
      RequestLogger.logg_request(controller.request.env)
    end
  end

end
