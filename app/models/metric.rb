class Metric < ActiveRecord::Base
  belongs_to :project
  belongs_to :organisation
  belongs_to :metric_type, foreign_key: :metric_code, primary_key: :key

  validates :project,      :presence => true
  validates :organisation, :presence => true
  validates :metric_type,  :presence => true
  validate :metric_within_permitted_range

  protected

  def metric_within_permitted_range
    if metric_type
      if metric_type.min_value && value < metric_type.min_value
        self.errors.add(:value, "is below the minimum acceptable for #{metric_code} metrics")
        return false
      end
      if metric_type.max_value && value > metric_type.max_value
        self.errors.add(:value, "is above the maximum acceptable for #{metric_code} metrics")
        return false
      end
    end
    true
  end
end
