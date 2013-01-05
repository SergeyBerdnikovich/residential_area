class NewsController < InheritedResources::Base
  before_filter :init_menu
end
