class ProjectsController < ApplicationController

  before_filter :load_project, only: [:show, :edit, :update]

  def index
    @projects = current_organisation.projects
  end

  def show
  end

  def edit
  end

  def new
    @project = current_organisation.projects.new
  end

  # create

  # update

  protected

  def load_project
    current_organisation.projects.where(key: params[:id]).first
  end

end
