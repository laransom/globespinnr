class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image, :string, null: false
  end
end
