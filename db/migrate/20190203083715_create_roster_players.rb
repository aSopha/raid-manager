class CreateRosterPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :roster_players do |t|
      t.references :roster
      t.references :player
    end
  end
end
