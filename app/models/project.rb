class Project < ActiveRecord::Base
  include URIKey

  belongs_to :organisation

  validates :organisation, :presence => true
  validates :name, :presence => true
  validates :key,  :presence => true, :uniqueness => {:scope => :organisation_id}

end
