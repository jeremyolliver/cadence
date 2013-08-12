require 'spec_helper'

describe Api::MetricsController do
  render_views

  before do
    @organisation = dummy_organisation
    @project = dummy_project
    @coverage = coverage_metric_type
  end

  describe 'unathorized' do
    it 'should not allow access' do
      should_not_change('@project.metrics.count') do
        post :create, valid_project_params
      end
      response.status.should eq(401)
    end
  end

  describe 'authorized' do
    before do
      request.headers['X-Cadence-API-Token'] = @organisation.api_token
    end

    it 'should accept valid params' do
      should_change_by('@project.metrics.count', 1) do
        post :create, valid_project_params
      end
      response.should be_success
      metric = @project.metrics.last
      metric.value.should eq(valid_project_params[:value])
    end

    it 'should not accept invalid values'

    it 'should not accept non-existent categories'

  end

  def valid_project_params
    {
      project_id: @project.to_param,
      category: 'coverage',
      value: 96
    }
  end

  def invalid_project_params
    {
      project_id: @project.to_param,
      category: 'coverage',
      value: 120
    }
  end

  def invalid_project_category_params
    {
      project_id: @project.to_param,
      category: 'doowap',
      value: 50
    }
  end

end
