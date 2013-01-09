class PagesController < ApplicationController
  def contacts
  end

  def developer
    @heads = Head.all
  end

  def files
  end

  def welcome
  end
end
