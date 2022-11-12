class CreateGenreCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_categories, id: :uuid, comment: 'ジャンルカテゴリー' do |t|
      t.string :name, null: false, comment: 'カテゴリー名'
      t.index :name, unique: true

      t.timestamps
    end
  end
end
