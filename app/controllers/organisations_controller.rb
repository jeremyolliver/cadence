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

  def create
    @organisation = Organisation.new(organisation_params)
    Organisation.transaction do
      # @organisation.add_user(current_user) # TODO:
      @organisation.save!
    end
    redirect_to organisations_path
  rescue ActiveRecord::RecordInvalid
    render :new, :status => 400
  end

  protected

  def organisation_params
    params.require(:organisation).permit(:name, :key)
  end

end
