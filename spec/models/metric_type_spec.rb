require 'spec_helper'

describe MetricType do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:key) }
  it { should validate_uniqueness_of(:key) }
end
