class ApplicationController < ActionController::Base
  protect_from_forgery

  def init_menu
    @completed_houses = House.get_completed_houses
    @uncompleted_houses = House.get_uncompleted_houses
    @apartments = Apartment.get_not_residential_apartments
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
