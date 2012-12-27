class RegistrationsController < Devise::RegistrationsController
  before_filter :init_menu
end