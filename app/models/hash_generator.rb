# Using gem https://github.com/peterhellberg/hashids.rb
class HashGenerator
  # Takes a link object with missing url_short attribute
  def self.create_hash(url)
    # encodes the url using a random number.
    url_short = Hashids.new(url)
    url_short.encode(1 + rand(100000))
  end
end
