class ProjectsController < ApplicationController

  before_filter :load_project, only: [:show, :edit, :update]
  before_filter :validate_organisation_is_visible, only: [:create, :update]

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

  def create
    @project = Project.new(project_params)
    if organisation_is_valid && @project.save
      flash[:success] = 'Project created'
      redirect_to project_path(@project)
    else
      render 'new', :status => 400
    end
  end

  def update
    @project.attributes = project_params
    if organisation_is_valid && @project.save
      flash[:success] = 'Project updated'
      redirect_to project_path(@project)
    else
      render 'edit', :status => 400
    end
  end

  protected

  def load_project
    @project = current_organisation.projects.where(key: params[:id]).first
  end

  def project_params
    params.require(:project).permit(:organisation_id, :name, :key, :public) # :public_by_default
  end

  def organisation_is_valid
    # TODO:
    # if @project.organisation.users.include?(current_user)
    #   true
    # else
    #   @project.errors.add(:organisation_id, "Is not a valid organisation")
    #   false
    # end
    true
  end

  # Don't let users create projects on organisations they don't have access to
  def validate_organisation_is_visible
    if params[:project]
      if org_id = params[:project][:organisation_id]
        raise ActionController::UnpermittedParameters.new([:organisation_id]) unless visible_organisations.map(&:id).include?(org_id.to_i)
      end
    end
  end

end
