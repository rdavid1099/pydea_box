require 'rails_helper'

describe 'existing user logs in' do
  context 'enters all correct information' do
    it 'logs in successfully' do
      create_user
      visit root_path
      click_on 'Login'
      expect(page).to have_content("Don't have an account? Sign up")

      fill_in 'email', with: 'test@tester.com'
      fill_in 'password', with: 'passwordtest'
      within('form') { click_on 'Login' }

      expect(page).to have_content('Successfully Logged In')
      expect(page).to have_content('Logout')
      expect(page).to have_content('Create New Idea')
      expect(page).to have_content('Most Current Ideas')
      expect(page).to have_content('Most Popular Idea Categories')
      expect(page).to have_content('Total Ideas: 0')
    end
  end

  context 'enters incorrect infomration' do
    it 'gets kicked back for wrong email' do
      create_user
      visit login_path

      fill_in 'email', with: 'test@tester.io'
      fill_in 'password', with: 'passwordtest'
      within('form') { click_on 'Login' }

      expect(page).to have_content('Email Address and/or Password not found')
    end

    it 'gets kicked back for wrong password' do
      create_user
      visit login_path

      fill_in 'email', with: 'test@tester.com'
      fill_in 'password', with: 'password'
      within('form') { click_on 'Login' }

      expect(page).to have_content('Email Address and/or Password not found')
    end
  end
end
