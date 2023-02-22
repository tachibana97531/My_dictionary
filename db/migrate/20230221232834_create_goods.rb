class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.integer :user_id,        null:false
      t.integer :dictionary_id,  null:false
      t.integer :good_amounts,   null:false
      t.timestamps
    end
  end
end
