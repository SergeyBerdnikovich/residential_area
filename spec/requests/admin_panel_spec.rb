# coding: utf-8
require 'spec_helper'
include Warden::Test::Helpers

describe "admin_panel" do

  let(:user) { create(:user, :name => 'admin') }
  before do
    user
    moderator = create(:user, :name => 'guest')
    moderator.role = create(:role, :name => 'moderator')
    login_as moderator
  end
  it "moderator should not destroy a user" do

    visit admin_user_path(user)

   expect { click_link('Delete User') }.to change(User, :count).by(0)
  end
end