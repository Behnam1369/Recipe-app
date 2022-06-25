require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Foods', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'lily@gmail.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
    visit recipies_path
  end

  describe 'index generates proper view' do
    it 'should have recipe name' do
      expect(page).to have_content('fried chicken')
    end
    it 'should visit the home page' do
      click_on('Remove')
      expect(page).not_to have_content('fried chicken')
    end
  end
end
