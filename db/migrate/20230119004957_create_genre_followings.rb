class CreateGenreFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_followings, id: :uuid, comment: 'ジャンルフォロー' do |t|
      t.references :account, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :genre, type: :uuid, foreign_key: { on_delete: :cascade }

      t.timestamps

      t.index [:account_id, :genre_id], unique: true
    end
  end
end
