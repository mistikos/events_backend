class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  helper_method :current_company

  private

    def current_company
      @company ||= current_admin.company
    end

  protected

  def configure_permitted_parameters
    if resource_class == Admin
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:dni, :fullname, :company_id, :email, :password, :password_confirmation, :current_password) }
    else
      super
    end
  end

  def layout_by_resource
    if devise_controller? && resource_name == :admin && (%w(sessions passwords).include? controller_name)
      "login"
    else
      "application"
    end
  end

end