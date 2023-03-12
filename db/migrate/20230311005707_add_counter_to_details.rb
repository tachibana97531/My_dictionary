class AddCounterToDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :details, :counter, :integer
  end
end
