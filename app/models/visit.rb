class Visit < ApplicationRecord
  validates :remote_host, :remote_addr, :http_user_agent, :http_referer, :request_uri, presence: true
end
