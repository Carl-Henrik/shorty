require 'test_helper'

class HashGeneratorTest < ActiveSupport::TestCase
  # Setting up a link with a fixed id to ensure the same result
  def setup
    @link = Link.new(url: "www.google.com")
  end

  # Checks to see that the returned attributes are randomized
  test 'returns different values' do
    assert_not_equal  HashGenerator.create_hash(@link.url), HashGenerator.create_hash(@link.url), 'method returns incorrect value'
  end

end
