require 'test_helper'

class HashGeneratorTest < ActiveSupport::TestCase
  # Setting up a link with a fixed id to ensure the same result
  def setup
    @link = Link.new(id: 123456789, url: "www.google.com")
  end

  # Checks to see that the resulting hash matches the expected result.
  test 'returns correct value' do
    assert_equal "waGQl8", HashGenerator.create_hash(@link), 'method returns incorrect value'
  end

end
