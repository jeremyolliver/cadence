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

end
