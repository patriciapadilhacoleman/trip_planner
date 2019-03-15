class DropUsersAndPosts < ActiveRecord::Migration[5.1]
  def change
    drop_table :users
    drop_table :posts
  end
end
