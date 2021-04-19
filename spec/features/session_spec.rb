require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  let(:user) { User.new(name: 'abdul12', id: 1) }

  def login_user(user)
    visit '/login'
    fill_in 'name', with: user.name
    click_button 'LogIn'
  end

  context 'User Login' do
    scenario 'successfully Login' do
      user.save
      login_user(user)
      expect(page).to have_content 'User was successfully SignIn.'
    end

    scenario 'Unable to Login' do
      user.name = nil
      login_user(user)
      expect(page).to have_content 'Unable to locat the User'
    end
  end

  context 'SignUp User' do
    scenario 'Successfully Signup' do
      visit signup_path
      fill_in 'user_name', with: 'Alica'
      click_button 'Create account'
      expect(page).to have_content 'Welcome to the app Alica!'
    end
  end
end
