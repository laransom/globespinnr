class NullifyCommentableIdType < ActiveRecord::Migration
  def up
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
    add_column :comments, :commentable_id, :integer, null: false
    add_column :comments, :commentable_type, :string, null: false
  end

  def down
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end

end
