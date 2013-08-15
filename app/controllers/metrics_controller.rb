class MetricsController < ApplicationController

  before_filter :load_project

  def show
    @metric_code = params[:metric_type]
    @metrics = @project.metrics.of_type(@metric_code).order('metrics.id DESC')
    if params[:from] && params[:to]
      @metrics.after_date(params[:from]).upto_date(params[:to])
    else
      @metrics.limit(50)
    end
    render :show
  end

  protected

  def load_project
    @project = current_organisation.projects.where(key: params[:project_id]).first
    raise ActiveRecord::RecordNotFound unless @project
  end

end
