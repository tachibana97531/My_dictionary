class CreateDictionaries < ActiveRecord::Migration[6.1]
  def change
    create_table :dictionaries do |t|

      t.timestamps
    end
  end
end
