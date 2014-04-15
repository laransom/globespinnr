require 'spec_helper'

feature 'user can like a photo', %q{
  An an authenticated user
  I can like a photo
  so all users can see photo rankings
} do

  context 'as an authenticated user' do

    let(:photo) { FactoryGirl.create(:photo) }

    before :each do
      sign_in_as(photo.user)
    end

    scenario 'successfully likes a review' do
      visit photo_path(photo)
      click_button 'Like'

      expect(page).to have_content 'Liked'
      expect(page).to have_content '1'
      expect(photo.user.likes.find_by(photo: photo).score).to eq(1)
    end

  end
end
