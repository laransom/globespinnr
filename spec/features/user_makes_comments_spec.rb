require 'spec_helper'

feature 'comment on a picture or location', %q{
  As an authenticated user
  I should be able to comment on photos or locations
  So that my comments will appear with that picture or location
} do

  context 'as an authenticated user' do

    let(:photo) {FactoryGirl.create(:photo) }

    before :each do
      sign_in_as(photo.user)
    end

    scenario 'user comments on photo' do
      pre_count = Comment.count
      visit photo_path(photo)

      click_on 'Comment'

      fill_in 'Body', with: 'I love this photo'
      click_on 'Add Comment'

      expect(page).to have_content 'Comment Added'
      expect(page).to have_content 'I love this photo'
      expect(Photo.count).to eq(pre_count + 1)
    end

    scenario 'user fails to enter content' do
      pre_count = Comment.count
      visit photo_path(photo)

      click_on 'Comment'

      click_on 'Add Comment'

      expect(page).to have_content "can't be blank"
      expect(Comment.count).to eq(pre_count)
    end

    scenario 'user comments on location' do
      pre_count = Comment.count
      location_path(photo.location)

      click_on 'Comment'

      fill_in 'Body', with: 'I love this place'
      click_on 'Add Comment'

      expect(page).to have_content 'Comment Added'
      expect(page).to have_content 'I love this place'
      expect(Photo.count).to eq(pre_count + 1)
    end
  end
end
