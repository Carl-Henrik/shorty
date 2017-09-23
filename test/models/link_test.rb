require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  #Setting up test object. No need for fixture since it's one object only.
  def setup
    @link = Link.new(url: "google.com", url_short: "3f4d")
  end


  #Validation Tests
  #Testing behavior when link object has all correct attribues
  test 'valid link' do
    assert @link.valid?
  end

  #Testing behavior when url is missing from link object
  test 'invalid without url' do
    @link.url = nil
    refute @link.valid?, 'link is valid without a url.'
    assert_not_nil @link.errors[:url], 'Theres no validation error for missing url.'
  end

  #Testing behavior when url is incorrectly formated in link object
  test 'invalid with incorrect url' do
    @link.url = "sdfhuis"
    refute @link.valid?, 'link is valid with incorrect url.'
    assert_not_nil @link.errors[:url], 'Theres no validation error for incorrectly formated url.'
  end

  #Testing behavior when url short is missing from link object
  test 'invalid without url_short' do
    @link.url_short = nil
    refute @link.valid?, 'link is valid without a url short.'
    assert_not_nil @link.errors[:url_short], 'Theres no validation error for missing url short.'
  end

  #Testing behavior when url short is a duplicate of an existing database entry
  test 'invalid with duplicate url_short' do
    link2 = @link.dup
    @link.save
    refute link2.valid?, 'link is valid with duplicate url_short.'
  end

end
