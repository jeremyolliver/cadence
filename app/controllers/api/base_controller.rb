class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session # Prevent CSRF for API's

  before_filter :requires_authenticated_organisation

  protected

  # Filters

  def requires_authenticated_organisation
    unless current_organisation
      render :json => {'error' => {'message' => "Please provide your API Token in the request header 'X-Cadence-API-Token'"}}, :status => :unauthorized
    end
  end

  # Helper Methods

  def current_organisation
    @current_organisation ||= Organisation.where(api_token: provided_token).first
  end
  helper_method :current_organisation

  def provided_token
    request.headers['X-Cadence-API-Token']
  end

end
