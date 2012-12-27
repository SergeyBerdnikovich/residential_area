class SessionsController < Devise::SessionsController
  before_filter :init_menu
end