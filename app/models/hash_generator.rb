# Using gem https://github.com/peterhellberg/hashids.rb
class HashGenerator
  # Takes a link object with missing url_short attribute
  def self.create_hash(link)
    # encodes the url using the database id to ensure a unique result.
    url_short = Hashids.new(link.url)
    url_short.encode(link.id)
  end
end
