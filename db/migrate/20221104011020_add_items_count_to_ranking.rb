class AddItemsCountToRanking < ActiveRecord::Migration[6.1]
  def change
    add_column :rankings, :items_count, :integer, comment: 'Items数'
  end
end
