require 'spec_helper'

feature 'delete photo from globespinnr', %q{
  As a authorized user
  I want to be able to delete a photo I uploaded
  So that it won't be visible to other users
} do
  context 'as an authenticated user' do

    let(:photo) { FactoryGirl.create(:photo) }

    before :each do
      sign_in_as(photo.user)
    end

    scenario 'delete photo' do
      photo_count = Photo.count
      visit location_path(photo.location)

      within ".photos" do
        first(:link, 'a').click
      end

      click_on 'Delete Photo'

      expect(Photo.count).to eq(photo_count - 1)
    end
  end
end
