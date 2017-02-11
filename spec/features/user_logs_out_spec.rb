require 'rails_helper'

describe 'signed in user signs out' do
  it 'clicks logout' do
    create_user
    visit login_path
    fill_in 'email', with: 'test@tester.com'
    fill_in 'password', with: 'passwordtest'
    within('form') { click_on 'Login' }

    click_on 'Logout'

    expect(page).to have_content('You Have Been Successfully Logged Out')
    expect(page).to have_content('Login')
    expect(page).to have_content('Sign Up')
  end
end
