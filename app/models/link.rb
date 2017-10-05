class Link < ApplicationRecord
  # Using gem https://github.com/ralovets/valid_url to validate correct URL
  # Uses hook to run method before object is saved to db
  validates :url, :url_short, :admin_code, presence: true
  validates :url_short, :admin_code, uniqueness: true
  validates :url, url: true
  before_save :add_protocol

  # overriding to use admin_code instead of id with urls
  def to_param
    admin_code
  end

  protected
  # Checking with regex if protocol is missing at start of url and adds it if missing.
  def add_protocol
    unless self.url[/\Ahttp:\/\//i] || self.url[/\Ahttps:\/\//i]
      self.url = "http://#{self.url}"
    end
  end
end
