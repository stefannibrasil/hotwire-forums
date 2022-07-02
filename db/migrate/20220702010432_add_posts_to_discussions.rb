class AddPostsToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :posts_count, :integer, default: 0
  end
end
