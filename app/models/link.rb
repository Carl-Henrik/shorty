class Link < ApplicationRecord
  #Using gem https://github.com/ralovets/valid_url to validate correct URL
  validates :url, :url_short, presence: true
  validates :url_short, uniqueness: true
  validates :url, url: true
end
