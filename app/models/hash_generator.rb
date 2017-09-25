# Using gem https://github.com/peterhellberg/hashids.rb
class HashGenerator
  # Takes an attribute to encode
  def self.create_hash(in_value)
    # encodes the attribute using a random number as salt.
    out_value = Hashids.new(in_value)
    out_value.encode(1 + rand(100000))
  end
end
