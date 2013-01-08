class PagesController < ApplicationController
  before_filter :init_menu
  def contacts
  end

  def developer
    @heads = Head.all
  end

  def files
  end
end
