require 'spec_helper'

feature 'sign up', %q{
  As an unauthenticated user
  I want to sign up to globespinnrs
  So that I can share my photos
} do

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Sterling'
    fill_in 'Last Name', with: 'Archer'
    fill_in 'Username', with: 'Blackturtleneck'
    file_path = 'spec/features/waterfall.jpg'
    attach_file('user_avatar', file_path)
    fill_in 'Email', with: 'spy@isis.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    within(:css, 'form') do
      click_button 'Sign Up'
    end

    expect(page).to have_content "Welcome! You have signed up successfully"
    expect(page).to have_content "Sign Out"
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    within(:css, 'form') do
      click_button 'Sign Up'
    end

    expect(page).to have_content("can't be blank")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'user_password', with: 'firstpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    within(:css, 'form') do
      click_button 'Sign Up'
    end

    expect(page).to have_content("doesn't match Password")
  end

  scenario 'signs up with a previously assigned email' do
    visit root_path
    click_link 'Sign Up'
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    within(:css, 'form') do
      click_button 'Sign Up'
    end

    expect(page).to have_content('has already been taken')
  end

  scenario 'signs up with a previously assigned username' do
    visit root_path
    click_link 'Sign Up'
    user = FactoryGirl.create(:user)
    fill_in 'Username',  with: user.username
    within(:css, 'form') do
      click_button 'Sign Up'
    end

    expect(page).to have_content('has already been taken')
  end

  scenario 'sign in fails with invalid image file' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Sterling'
    fill_in 'Last Name', with: 'Archer'
    fill_in 'Username', with: 'Blackturtleneck'
    file_path = 'spec/features/delete_image_spec.rb'
    attach_file('user_avatar', file_path)
    fill_in 'Email', with: 'spy@isis.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    within(:css, 'form') do
      click_button 'Sign Up'
    end

    expect(page).to have_content "Please review the problems below:"
  end

end
