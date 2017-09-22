require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  def setup
    @link = Link.new(url: "google.com", url_short: "3f4d")
    @link2 = @link.dup
  end



  test 'valid link' do
    assert @link.valid?
  end

  test 'invalid without url' do
    @link.url = nil
    refute @link.valid?, 'link is valid without a url.'
    assert_not_nil @link.errors[:url], 'Theres no validation error for missing url.'
  end

  test 'invalid with incorrect url' do
    @link.url = "sdfhuis"
    refute @link.valid?, 'link is valid with incorrect url.'
    assert_not_nil @link.errors[:url], 'Theres no validation error for incorrectly formated url.'
  end

  test 'invalid without url_short' do
    @link.url_short = nil
    refute @link.valid?, 'link is valid without a url short.'
    assert_not_nil @link.errors[:url_short], 'Theres no validation error for missing url short.'
  end

  test 'invalid with duplicate url_short' do
    refute @link2.valid?, 'link is valid with duplicate url_short.'
  end

end
