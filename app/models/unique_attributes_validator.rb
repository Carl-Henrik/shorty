class UniqueAttributesValidator
  # Validates the object. Enters a loop if url_short already exists to ensure a unique value
  def self.ensure_unique(link)
    link.valid?
    until link.errors[:url_short] != ["has already been taken"]
      link.url_short = HashGenerator.create_hash(link.url)
      link.valid?
    end
    return link
  end

end
