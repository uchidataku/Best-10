class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, id: :uuid, comment: '項目' do |t|
      t.string :name, null: false, comment: '項目名'
      t.references :ranking, type: :uuid, foreign_key: { on_delete: :cascade }

      t.index [:name, :ranking_id], unique: true

      t.timestamps
    end
  end
end
