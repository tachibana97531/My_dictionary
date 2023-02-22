class CreateKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :keys do |t|
      t.integer :detail_id,   null:false
      t.string :key_word,     null:false
      t.text :key_sentence,   null:false
      t.timestamps
    end
  end
end
