require 'spec_helper'

feature 'sign up', %q{
  As an unauthenticated user
  I want to sign up to globespinnrs
  So that I can share my photos
} do

  scenario 'specifying valid and required information' do
    visit new_user_registration_path
    fill_in 'First Name', with: 'Sterling'
    fill_in 'Last Name', with: 'Archer'
    fill_in 'Username', with: 'Blackturtleneck'
    fill_in 'Email', with: 'spy@isis.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content "Welcome Sterling"
    expect(page).to have_content "Sign Out"
  end

  scenario 'required information is not supplied'
  scenario 'password confirmation does not match confirmation'
end
