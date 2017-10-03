# Class used to reformat the data from request.env and save it to db via Visit model
class RequestLogger
  # this method takes a hash with curated data from request.env as argument
  # Checks if :http_user_agent is nil, if not it runs detect_user_agent method
  # runs replace_nil method
  # Creates a Visit object and assigns attributes from the final hash and proceeds to save to db
  def self.logg_request(env)
    @visit_attributes = env
    unless @visit_attributes[:http_user_agent].nil?
      detect_user_agent
    end
    replace_nil
    visit = Visit.new(@visit_attributes)
    visit.save
  end

  # Uses gem https://github.com/gshutler/useragent to parse the string :http_user_agent
  # Assigns the parsed data to user_agent_attributes hash
  # unlike .browser & .platform the .version returns a version object isntead of string therefore to_str to get at string value
  # replaces the string value paired with @visit_attributes[:http_user_agent] with the new hash
  def self.detect_user_agent
    user_agent = UserAgent.parse(@visit_attributes[:http_user_agent])
    user_agent_attributes = {
      raw: @visit_attributes[:http_user_agent],
      browser: user_agent.browser,
      version: user_agent.version.to_str,
      platform: user_agent.platform
    }
    @visit_attributes[:http_user_agent] = user_agent_attributes
  end

  # Iterates through the hash replacing nil values with "unknown"
  def self.replace_nil
    @visit_attributes.each do |key, value|
      @visit_attributes[key] = "unknown" unless value
    end
  end

end
