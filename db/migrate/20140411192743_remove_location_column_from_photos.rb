class RemoveLocationColumnFromPhotos < ActiveRecord::Migration
  def up
    remove_column :photos, :location
  end

  def down
    add_column :photos, :location, :string, null: false
  end
end
