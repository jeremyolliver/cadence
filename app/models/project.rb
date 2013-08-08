class Project < ActiveRecord::Base
  include URIKey

  belongs_to :organisation

  validates :organisation, :presence => true
  validates :name, :presence => true
  validates :key,  :presence => true, :uniqueness => {:scope => :organisation_id}

  has_many :metrics

  def recent_updates
    metrics.order('created_at DESC').limit(20)
  end

end
