class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.integer :dictionary_id, null:false
      t.string :word,           null:false
      t.string :read,           null:false
      t.text :explanation,      null:false
      t.timestamps
    end
  end
end
