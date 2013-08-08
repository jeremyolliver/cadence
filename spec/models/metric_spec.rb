require 'spec_helper'

describe Metric do
  it { should validate_presence_of(:organisation) }
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:metric_type) }

  it 'should correctly lookup MetricType' do
    @type = coverage_metric_type
    metric = Metric.create(metric_code: 'coverage', value: 80)
    metric.metric_type.should eq(@type)
  end

  it 'should validate within min-max of metric type' do
    cov = coverage_metric_type
    below = Metric.new(metric_code: 'coverage', value: -2)
    below.should_not be_valid
    below.errors['value'].should_not be_empty
    above = Metric.new(metric_code: 'coverage', value: 101)
    below.should_not be_valid
    below.errors['value'].should_not be_empty
  end
end
