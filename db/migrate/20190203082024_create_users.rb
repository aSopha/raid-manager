class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps

      t.string :account_id, null: false
      t.string :battletag, null: false
      t.string :token

      t.index :account_id, unique: true
      t.index :battletag, unique: true
      t.index :token, unique: true
    end
  end
end
