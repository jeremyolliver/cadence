require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProjectsHelper. For example:
#
# describe ProjectsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ProjectsHelper do

  describe '#formatted_metric_value' do
    before do
      @coverage = coverage_metric_type
      @project = dummy_project
    end

    it 'should format value with significant figures' do
      metric = Metric.create(metric_type: @coverage, value: (100.0 * rand), project: @project)
      string_result = helper.formatted_metric_value(metric)
      string_result.should match /^\d{1,2}\.\d{2}\%$/
    end
  end

  describe '#friendly_datetime_format' do
    it 'should format the current time' do
      @time = Time.zone.now
      string_result = helper.friendly_datetime_format(@time)
      string_result.should match /\d{2}\:\d{2}:\d{2}(a|p)m \d{1,2} \w+ \d{4}/
    end
    it 'should use the correct formatting values' do
      @time = Time.new(2013, 8, 16, 13, 29, 5, +12)
      string_result = helper.friendly_datetime_format(@time)
      string_result.should eq("01:29:05pm 16 August 2013")
    end
  end

end
