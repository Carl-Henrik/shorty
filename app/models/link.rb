class Link < ApplicationRecord
  validates :url, :url_short, presence: true
  validates :url, :url => true
  validates :url_short, uniqueness: true
end
