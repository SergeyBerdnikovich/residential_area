class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_menu

  def init_menu
    @completed_houses = House.get_completed_houses
    @uncompleted_houses = House.get_uncompleted_houses
    @apartments = Apartment.get_not_residential_apartments
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    resource.role && resource.role.name == 'admin' ? admin_dashboard_path : root_path
  end

  def authenticate_admin_user!
    raise SecurityError unless current_user.role.name == 'admin'
  end

  rescue_from SecurityError do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
