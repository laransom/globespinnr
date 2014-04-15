require 'spec_helper'

feature 'user can go to their own profile page', %q{
  As an authenticated user
  I can visit my, and other users profile page
  So I can see where they've been, recent comments and top liked photos
} do

  context 'as an authenticated user' do

    let(:user){ FactoryGirl.create(:user) }

    before :each do
      sign_in_as(user)
    end

    scenario 'user visits their own profile page' do
      visit root_path

      click_on 'a'

      expect(page).to have_content user.full_name
      expect(page).to have_content 'Most liked photos'
      expect(page).to have_content 'Recent Comments'

    end


  end


end
