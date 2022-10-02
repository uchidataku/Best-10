class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :accounts, id: :uuid, comment: 'アカウント' do |t|
      t.string :username, null: false, comment: 'ユーザーネーム'
      t.string :password_digest, null: false, comment: 'パスワードのハッシュ値'
      t.boolean :is_system_admin, default: false, null: false, comment: 'adminか'

      t.index :username, unique: true

      t.timestamps
    end
  end
end
