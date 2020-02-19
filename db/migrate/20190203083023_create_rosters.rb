class CreateRosters < ActiveRecord::Migration[5.2]
  def change
    create_table :rosters do |t|
      t.timestamps

      t.string :roster_name, null: false
      t.index :roster_name, unique: true
      t.references :user
    end
  end
end
