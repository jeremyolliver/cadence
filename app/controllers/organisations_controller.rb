class OrganisationsController < ApplicationController

  skip_filter :ensure_organisation_selected

  # TODO: all actions need scoping to current_user when user authentication is implemented
  def index
    # @organisations = current_user.organisations.order(:name)
    @organisations = Organisation.order(:name)
  end

  def show
    # current_user.organisations.where(:key => params[:id]).first
    @organisation = Organisation.where(:key => params[:id]).first
  end

  def new
    @organisation = Organisation.new
  end

end
