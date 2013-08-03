class Project < ActiveRecord::Base

  belongs_to :organisation

  validates :name, :presence => true
  validates :key,  :presence => true, :uniqueness => {:scope => :organisation_id}

end
