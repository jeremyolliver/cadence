class ProjectsController < ApplicationController

  def index
    @projects = current_organisation.projects
  end

end
