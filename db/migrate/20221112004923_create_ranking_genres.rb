class CreateRankingGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :ranking_genres, id: :uuid, comment: 'RankingとGenreの中間テーブル' do |t|
      t.references :ranking, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :genre, type: :uuid, foreign_key: { on_delete: :cascade }
      t.index %i[ranking_id genre_id], unique: true

      t.timestamps
    end
  end
end
