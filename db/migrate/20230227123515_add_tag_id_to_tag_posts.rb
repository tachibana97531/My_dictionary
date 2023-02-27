class AddTagIdToTagPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :tag_posts, :tag_id, :integer
  end
end
