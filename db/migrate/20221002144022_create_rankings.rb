class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings, id: :uuid, comment: 'ランキング' do |t|
      t.string :title, null: false, comment: 'タイトル'
      t.integer :genre, default: 0, null: false, comment: 'ジャンル'
      t.references :creator, type: :uuid, foreign_key: { on_delete: :cascade, to_table: :accounts }

      t.index :title, unique: true

      t.timestamps
    end
  end
end
