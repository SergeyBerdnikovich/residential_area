class PagesController < ApplicationController
  def contacts
  end

  def developer
    @heads = Head.all
    @partners = Partner.all
  end

  def files
  end

  def welcome
    @gallery = Gallery.for_carousel
  end
end
