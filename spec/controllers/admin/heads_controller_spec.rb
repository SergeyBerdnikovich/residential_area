# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::HeadsController do
  render_views

  let(:head) { create(:head) }
  let(:location) { create(:location) }
  let(:phone_number) { create(:phone_number) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'page(without phone_numbers, location) should have content "Head was successfully updated"', :vcr do

      visit edit_admin_head_path(head)
      fill_in('ФИО', :with => 'Никитин Валерий Павлович')
      fill_in('Должность', :with => 'начальник склада №3')
      fill_in('Number', :with => '+37529 339 76 39')
      fill_in('Name', :with => 'Дом начальника склада №3')
      fill_in('Address', :with => 'Калинина 17, Минск')
      click_button('Update Head')

      page.should have_content("Head was successfully updated")
    end

    it 'page(with phone_numbers, location) should have content "Head was successfully updated"', :vcr do

      head.phone_numbers << phone_number
      head.location = location
      visit edit_admin_head_path(head)
      fill_in('ФИО', :with => 'Никитин Валерий Павлович')
      fill_in('Должность', :with => 'начальник склада №3')
      fill_in('Number', :with => '+37529 339 76 39')
      fill_in('Name', :with => 'Дом начальника склада №3')
      fill_in('Address', :with => 'Калинина 17, Минск')
      click_button('Update Head')

      page.should have_content("Head was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Head was successfully created"', :vcr do

      visit new_admin_head_path
      fill_in('ФИО', :with => 'Никитин Валерий Павлович')
      fill_in('Должность', :with => 'начальник склада №3')
      fill_in('Number', :with => '+37529 339 76 39')
      fill_in('Name', :with => 'Дом начальника склада №3')
      fill_in('Address', :with => 'Калинина 17, Минск')
      click_button('Create Head')

      page.should have_content("Head was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Head Details"' do

      visit admin_head_path(head)

      page.should have_content("Head Details")
    end
  end
end