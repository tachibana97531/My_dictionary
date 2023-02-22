class CreateDictionaries < ActiveRecord::Migration[6.1]
  def change
    create_table :dictionaries do |t|
      t.integer :user_id,     null:false
      t.string :title,        null:false
      t.text :summery,        null:false
      t.integer :post_status, null:false, default:"0"
      t.timestamps
    end
  end
end
