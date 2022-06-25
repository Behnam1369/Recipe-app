require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Foods', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'lily@gmail.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
  end

  describe 'GET /index' do
    it 'should visit the home page' do
      expect(page).to have_content('Foods')
    end
  end

  describe 'DELETE /destroy' do
    it 'should visit the login page' do
      click_on('Log out')
      expect(page).to have_content('Log in')
    end
  end
end
