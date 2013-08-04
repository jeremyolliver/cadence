class OrganisationsController < ApplicationController

  before_filter :load_organisation, only: [:show, :edit, :update, :select]
  skip_filter :ensure_organisation_selected

  # TODO: all actions need scoping to current_user when user authentication is implemented
  def index
    # @organisations = current_user.organisations.order(:name)
    @organisations = Organisation.order(:name)
  end

  def new
    @organisation = Organisation.new
  end

  def show
  end

  def edit
  end

  def select
    set_current_organisation!(@organisation)
    redirect_to projects_path
  end

  def create
    @organisation = Organisation.new(organisation_params)
    Organisation.transaction do
      # @organisation.add_user(current_user) # TODO:
      @organisation.save!
    end
    flash[:success] = 'Organisation created'
    redirect_to organisations_path
  rescue ActiveRecord::RecordInvalid
    render :new, :status => 400
  end

  def update
    if @organisation.update_attributes(organisation_params)
      flash[:success] = 'Organisation updated'
      redirect_to organisations_path
    else
      render :edit, :status => 400
    end
  end

  protected

  def load_organisation
    # TODO:
    # current_user.organisations.where(:key => params[:id]).first
    @organisation = Organisation.where(key: params[:id]).first
    raise ActiveRecord::RecordNotFound unless @organisation
  end

  def organisation_params
    params.require(:organisation).permit(:name, :key) # :public_by_default
  end

end
