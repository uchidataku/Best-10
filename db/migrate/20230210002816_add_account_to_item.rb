class AddAccountToItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :account, type: :uuid, foreign_key: { on_delete: :cascade }
  end
end
