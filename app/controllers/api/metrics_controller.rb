class Api::MetricsController < Api::BaseController

  before_filter :load_project

  def create
    if @metric = @project.metrics.create({
        metric_code: metric_params[:category],
        value: metric_params[:value],
        organisation: current_organisation
      })
      render :json => :created
    else
      render :json => :error
    end
  end

  protected

  def metric_params
    params.require(:category)
    params.require(:value)
    params
  end

  def load_project
    @project = current_organisation.projects.where(key: params[:project_id]).first
    raise ActiveRecord::RecordNotFound unless @project
  end

end
