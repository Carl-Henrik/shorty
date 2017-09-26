require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  def setup
    @visit = visits(:one)
  end

  #Validation Tests
  #Testing behavior when visit object has all correct attribues
  test 'valid visit' do
    assert @visit.valid?
  end

  #Testing behavior when remote_host is missing from visit object
  test 'invalid without remote_host' do
    @visit.remote_host = nil
    refute @visit.valid?, 'visit is valid without remote_host.'
    assert_not_nil @visit.errors[:remote_host], 'Theres no validation error for missing remote_host.'
  end

  #Testing behavior when remote_addr is missing from visit object
  test 'invalid without remote_addr' do
    @visit.remote_addr = nil
    refute @visit.valid?, 'visit is valid without remote_addr.'
    assert_not_nil @visit.errors[:remote_addr], 'Theres no validation error for missing remote_addr.'
  end

  #Testing behavior when http_user_agent is missing from visit object
  test 'invalid without http_user_agent' do
    @visit.http_user_agent = nil
    refute @visit.valid?, 'visit is valid without http_user_agent.'
    assert_not_nil @visit.errors[:http_user_agent], 'Theres no validation error for missing http_user_agent.'
  end

  #Testing behavior when http_referer is missing from visit object
  test 'invalid without http_referer' do
    @visit.http_referer = nil
    refute @visit.valid?, 'visit is valid without http_referer.'
    assert_not_nil @visit.errors[:http_referer], 'Theres no validation error for missing http_referer.'
  end

  #Testing behavior when request_uri is missing from visit object
  test 'invalid without request_uri' do
    @visit.request_uri = nil
    refute @visit.valid?, 'visit is valid without request_uri.'
    assert_not_nil @visit.errors[:request_uri], 'Theres no validation error for missing request_uri.'
  end

end
