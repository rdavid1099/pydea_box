require 'rails_helper'

describe 'user creates an account' do
  context 'fills in all correct fields' do
    it 'successfully creates account' do
      visit root_path
      click_on 'Sign Up'

      fill_in 'user_username', with: 'testing'
      fill_in 'user_email', with: 'test@testing.io'
      fill_in 'user_password', with: 'testingpassword'
      fill_in 'user_password_confirmation', with: 'testingpassword'
      click_on 'Create Account'

      expect(page).to have_content('Account Successfully Created')
      expect(page).to have_content('Logout')
      expect(page).to have_content('Create New Idea')
      expect(page).to have_content('Most Current Ideas')
      expect(page).to have_content('Most Popular Idea Categories')
      expect(page).to have_content('Total Ideas: 0')
    end
  end
end
