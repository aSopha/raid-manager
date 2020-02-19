class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.timestamps

      t.string :warcraft_logs_link, null: false
      t.string :role, null: false
      t.string :player_name, null: false
      t.string :player_class, null: false
      t.float :heart_level, null: false
      t.float :item_level, null: false
      t.float :avg_normal_parse
      t.float :avg_heroic_parse
      t.float :avg_mythic_parse

      t.index :player_name, unique: true
    end
  end
end
