# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe Admin::PartnersController do
  render_views

  let(:partner) { create(:partner) }
  let(:location) { create(:location) }
  let(:phone_number) { create(:phone_number) }
  before do
    login_as create(:user)
  end
  describe "GET 'edit'" do
    it 'page(without phone_numbers, location) should have content "Partner was successfully updated"', :vcr do

      visit edit_admin_partner_path(partner)
      fill_in('Название', :with => 'ОАО Кристалл')
      fill_in('Описание', :with => 'поставщик алкоголя')
      fill_in('Number', :with => '+37529 339 76 39')
      fill_in('Name', :with => 'Дом начальника склада №3')
      fill_in('Address', :with => 'Калинина 17, Минск')
      click_button('Update Partner')

      page.should have_content("Partner was successfully updated")
    end

    it 'page(with phone_numbers, location) should have content "Partner was successfully updated"', :vcr do

      partner.phone_numbers << phone_number
      partner.location = location
      visit edit_admin_partner_path(partner)
      fill_in('Название', :with => 'ОАО Кристалл')
      fill_in('Описание', :with => 'поставщик алкоголя')
      fill_in('Number', :with => '+37529 339 76 39')
      fill_in('Name', :with => 'Дом начальника склада №3')
      fill_in('Address', :with => 'Калинина 17, Минск')
      click_button('Update Partner')

      page.should have_content("Partner was successfully updated")
    end
  end

  describe "GET 'new'" do
    it 'page should have content "Partner was successfully created"', :vcr do

      visit new_admin_partner_path
      fill_in('Название', :with => 'ОАО Кристалл')
      fill_in('Описание', :with => 'поставщик алкоголя')
      fill_in('Number', :with => '+37529 339 76 39')
      fill_in('Name', :with => 'Дом начальника склада №3')
      fill_in('Address', :with => 'Калинина 17, Минск')
      click_button('Create Partner')

      page.should have_content("Partner was successfully created")
    end
  end

  describe "GET 'show'" do
    it 'page should have content "Partner Details"' do

      visit admin_partner_path(partner)

      page.should have_content("Partner Details")
    end
  end
end