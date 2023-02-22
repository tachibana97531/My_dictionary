class CreateTagPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_posts do |t|
      t.integer :user_id,        null:false
      t.integer :dictionary_id,  null:false
      t.timestamps
    end
  end
end
