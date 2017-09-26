class RequestLogger
  def self.logg_request(env)
    @visit_attributes = {
      remote_host: env["REMOTE_HOST"],
      remote_addr: env["REMOTE_ADDR"],
      http_user_agent: env["HTTP_USER_AGENT"],
      http_referer: env["HTTP_REFERER"],
      request_uri: env["REQUEST_URI"]
    }
    replace_nil
    visit = Visit.new(@visit_attributes)
    visit.save
  end

  def self.replace_nil
    @visit_attributes.each do |key, value|
      if value.nil?
        value = "unknown"
      end
    end
  end

end
