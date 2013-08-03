class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :ensure_organisation_selected

  protected

  def ensure_organisation_selected
    unless current_organisation
      redirect_to organisations_path
    end
  end

  def current_organisation
    if session[:organisation_id]
      Organisation.where({:id => session[:organisation_id]}).first
    elsif o = Organisation.first
      session[:organisation_id] = o.id
    else
      nil
    end
  end
  helper_method :current_organisation

  def set_current_organisation!(org)
    session[:organisation_id] = org.id
  end

end
