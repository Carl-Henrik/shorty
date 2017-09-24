require 'test_helper'

class UniqueShortValidatorTest < ActiveSupport::TestCase
  # Setting up a link with a fixed id to ensure the same result
  def setup
    @link = Link.create(url: "www.google.com", url_short: "test")
    @link2 = Link.new(url: "www.google.com", url_short: "test")
  end

  # Sends link object with duplicate url_short attribute to UniqueShortValidator
  # saves object to db to test if it passes validation.
  test 'ensure unique url_short attribute before save' do
    assert_difference('Link.count') do
      @link2 = UniqueShortValidator.ensure_unique(@link2)
      @link2.save
    end
  end

end
