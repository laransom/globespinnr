class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.string :location, null: false

      t.timestamps
    end
  end
end
