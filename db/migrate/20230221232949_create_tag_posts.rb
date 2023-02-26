class CreateTagPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_posts do |t|
      t.integer :user_id,        null:false
      t.integer :dictionary_id,  null:false

      t.timestamps
    end
    add_index:tag_posts,[:dictionary_id,:tag_id],unique:true
  end
end
