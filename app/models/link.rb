class Link < ApplicationRecord
  #Using gem https://github.com/ralovets/valid_url to validate correct URL
  validates :url, :url_short, presence: true
  validates :url, url: true
  validates :url_short, uniqueness: true
  # uses hook to run methods before object i saved to db
  before_save :add_protocol

  protected
  # Checking with regex if Http:// is missing at start of url and adds it if missing.
  def add_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end


  end
