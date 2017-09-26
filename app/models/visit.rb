class Visit < ApplicationRecord
  validates :request_uri, :http_user_agent, :remote_addr, :remote_host, :http_referer, presence: true
end
