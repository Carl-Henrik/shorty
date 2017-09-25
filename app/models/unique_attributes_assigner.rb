class UniqueAttributesAssigner
  # Assigns url_short & admin_code to the object while making sure they are unique
  def self.ensure_unique(link)
    # Validates the object before loops. Used to make uniqe_attributes_assigner_test work.
    link.valid?
    # Assigns url_short on first loop and validates at end.
    # If there is a duplication error it assigns a new randomized attribute via HashGenerator
    # Unless the db is massive it shouldnt need more than one extra loop.
    until (link.errors[:url_short] != ["has already been taken"]) && (link.url_short != nil)
      link.url_short = HashGenerator.create_hash(link.url)
      link.valid?
    end
    # Same as previous loop except it passes the new url_short to HashGenerator instead of url and sets the admin_code attribute in the link object
    # This ensures url_short and admin_code won't be the same.
    until (link.errors[:admin_code] != ["has already been taken"]) && (link.admin_code != nil)
      link.admin_code = HashGenerator.create_hash(link.url_short)
      link.valid?
    end

    return link
  end
end
