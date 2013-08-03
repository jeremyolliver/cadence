class Organisation < ActiveRecord::Base

  has_many :projects

  validates :name,      :presence => true
  validates :key,       :presence => true, :uniqueness => true
  validates :api_token, :presence => true, :uniqueness => true

  before_validation :assign_api_token

  def to_param
    key
  end

  protected

  def assign_api_token
    if self.api_token.blank?
      self.api_token = SecureRandom.hex
    end
    true
  end

end
