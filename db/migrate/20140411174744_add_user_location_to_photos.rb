class AddUserLocationToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :location_id, :string, null: false
    add_column :photos, :user_id, :string, null: false
  end
end
