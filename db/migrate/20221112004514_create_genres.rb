class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres, id: :uuid, comment: 'ジャンル' do |t|
      t.string :name, null: false, comment: 'ジャンル名'
      t.references :genre_category, type: :uuid, foreign_key: { on_delete: :cascade }
      t.index :name, unique: true

      t.timestamps
    end
  end
end
