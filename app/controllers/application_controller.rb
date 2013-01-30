class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_menu
  before_filter :set_locale

  def init_menu
    @completed_houses = House.get_completed
    @uncompleted_houses = House.get_uncompleted
    @not_residential_apartments_for_menu = Apartment.get_not_residential
   end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    resource.role && resource.role?(:admin) ? admin_dashboard_path : root_path
  end

  def authenticate_admin_user!
    if current_user
      unless current_user.role.name == 'admin' || current_user.role.name == 'moderator'
        raise SecurityError
      end
    else
      redirect_to root_path, :alert => 'please log in'
    end
  end

  rescue_from SecurityError do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
