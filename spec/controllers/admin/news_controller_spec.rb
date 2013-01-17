# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::NewsController do
  render_views

  let(:news) { create(:news) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'page should have content "News was successfully updated"' do

      visit edit_admin_news_path(news)
      fill_in('Title', :with => 'Новость о кошке')
      fill_in('Content', :with => '<h1>Кошка</h1>')
      click_button('Update News')

      page.should have_content("News was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "News was successfully created"' do

      visit new_admin_news_path
      fill_in('Title', :with => 'Новость о кошке')
      fill_in('Content', :with => '<h1>Кошка</h1>')
      click_button('Create News')

      page.should have_content("News was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "News Details"' do

      visit admin_news_path(news)

      page.should have_content("News Details")
    end
  end

  describe "GET 'index'" do
    it 'page should have content "News"' do

      news
      visit admin_news_index_path

      page.should have_content("News")
    end
  end
end