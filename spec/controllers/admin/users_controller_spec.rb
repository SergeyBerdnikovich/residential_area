# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::UsersController do
  render_views

  let(:user) { create(:user, :name => 'Igor') }
  let(:role) { create(:role) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'page should have content "User was successfully updated"' do

      role
      visit edit_admin_user_path(user)
      select(role.name, :from => 'user_role_id')
      fill_in('Имя', :with => 'Kolya')
      fill_in('Эл. почта', :with => 'asdasd@ad.as')
      fill_in('Пароль', :with => '123456')
      click_button('Update User')

      page.should have_content("User was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "User was successfully created"' do

      role
      visit new_admin_user_path
      select(role.name, :from => 'user_role_id')
      fill_in('Имя', :with => 'Kolya')
      fill_in('Эл. почта', :with => 'asdasd@ad.as')
      fill_in('Пароль', :with => '123456')
      click_button('Create User')

      page.should have_content("User was successfully created")
    end
  end

  describe "GET 'index'" do
    it 'page should have content "Users"' do

      visit admin_users_path

      page.should have_content("Users")
    end
  end
end