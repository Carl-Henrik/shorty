require 'test_helper'

class UniqueAttributesValidatorTest < ActiveSupport::TestCase
  # Setting up two link with identical attributes. First is saved to db on create.
  def setup
    @link = Link.create(url: "www.google.com", url_short: "test", admin_code: "test2")
    @link2 = Link.new(url: "www.google.com", url_short: "test", admin_code: "test2")
  end

  # Sends link object with duplicate attributes to UniqueAttributesValidator
  # saves object to db to test if it passes validation.
  test 'ensure unique attributes before save' do
    assert_difference('Link.count') do
      @link2 = UniqueAttributesValidator.ensure_unique(@link2)
      @link2.save
    end
  end

end
