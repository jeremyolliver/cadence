# name: string (required)
# key: string (required)
# min_value: float (optional)
# max_value: float (optional)
# format_prefix: string (e.g. '$')
# format_suffix: string (e.g. '%')
# positive: boolean (true indicates a high value is a good thing)

class MetricType < ActiveRecord::Base
  include URIKey

  validates :name, :presence => true
  validates :key, :presence => true, :uniqueness => true
  validates :positive, :inclusion => [true, false]
end
