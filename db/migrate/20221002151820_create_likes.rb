class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes, id: :uuid, comment: 'いいね' do |t|
      t.references :account, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :item, type: :uuid, foreign_key: { on_delete: :cascade }

      t.index [:account_id, :item_id], unique: true

      t.timestamps
    end
  end
end
