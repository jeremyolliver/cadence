# This module/concern is for use on models that have a column :key which is intended to be used
# as a unique identifier for both database queries and as a component in a URL
# this module *does not* provide a uniqueness validation, which is expected to be implemented
# as well as inclusion of this module. That is because the uniqueness may or may not have a scope
module URIKey
  extend ActiveSupport::Concern

  included do
    before_validation :sanitize_key
  end

  def sanitize_key
    if self.key.present?
      sanitized = self.key.gsub(/\s+/, '-')
      sanitized.gsub!(/[^\w\-]/, '')
      self.key = sanitized
    end
  end

  def to_param
    key
  end

end
