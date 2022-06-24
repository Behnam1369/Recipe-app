require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Recipes', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'lily@gmail.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
  end

  describe 'GET /index' do
    it 'should visit recipies index' do
      visit recipies_path
      expect(page).to have_content('New recipe')
    end
  end
end