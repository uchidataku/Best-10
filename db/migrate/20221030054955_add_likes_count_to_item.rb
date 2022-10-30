class AddLikesCountToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :likes_count, :integer, comment: 'Likes数'
  end
end
