class Link < ApplicationRecord
  validates :url, :url_short, presence: true
  validates :url_short, uniqueness: true
  validates :url, url: true
end
