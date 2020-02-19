# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ player_name: 'Star Wars' }, { player_name: 'Lord of the Rings' }])
#   Character.create(player_name: 'Luke', movie: movies.first)


if Rails.env == 'development'
  user = User.create!(
    account_id: '123123',
    battletag: 'diklove',
    token: '123abc'
  )

  player1 = Player.create!(heart_level: '31', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '390', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '14', role: 'dps', player_class: 'Warlock', player_name: 'Plu')
  player2 = Player.create!(heart_level: '32', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '392', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '12', role: 'dps', player_class: 'Priest', player_name: 'Alue')
  player3 = Player.create!(heart_level: '33', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '393', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '14', role: 'dps', player_class: 'Shaman', player_name: 'Shama')
  player4 = Player.create!(heart_level: '34', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '394', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '13', role: 'dps', player_class: 'Paladin', player_name: 'Tyd')
  player5 = Player.create!(heart_level: '35', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '395', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '51', role: 'healer', player_class: 'Druid', player_name: 'Aqua')
  player6 = Player.create!(heart_level: '36', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '396', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '61', role: 'tank', player_class: 'Demon Hunter', player_name: 'Doops')
  player7 = Player.create!(heart_level: '31', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '390', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '14', role: 'dps', player_class: 'Death Knight', player_name: 'Pluz')
  player8 = Player.create!(heart_level: '32', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '392', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '12', role: 'dps', player_class: 'Hunter', player_name: 'Aluez')
  player9 = Player.create!(heart_level: '33', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '393', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '14', role: 'dps', player_class: 'Monk', player_name: 'Shamaz')
  player10 = Player.create!(heart_level: '34', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '394', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '13', role: 'dps', player_class: 'Warlock', player_name: 'Tydz')
  player11 = Player.create!(heart_level: '35', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '395', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '51', role: 'healer', player_class: 'Druid', player_name: 'Aquaz')
  player12 = Player.create!(heart_level: '36', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '396', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '61', role: 'tank', player_class: 'Demon Hunter', player_name: 'Doopsz')
  player13 = Player.create!(heart_level: '31', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '390', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '14', role: 'dps', player_class: 'Mage', player_name: 'Pluy')
  player14 = Player.create!(heart_level: '32', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '392', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '12', role: 'dps', player_class: 'Hunter', player_name: 'Aluey')
  player15 = Player.create!(heart_level: '33', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '393', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '14', role: 'dps', player_class: 'Shaman', player_name: 'Shamay')
  player16 = Player.create!(heart_level: '34', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '394', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '13', role: 'dps', player_class: 'Warrior', player_name: 'Tydy')
  player17 = Player.create!(heart_level: '35', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '395', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '51', role: 'healer', player_class: 'Druid', player_name: 'Aquay')
  player18 = Player.create!(heart_level: '36', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '396', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '61', role: 'tank', player_class: 'Demon Hunter', player_name: 'Doopsy')
  player19 = Player.create!(heart_level: '35', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '395', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '51', role: 'healer', player_class: 'Druid', player_name: 'Aquaq')
  player20 = Player.create!(heart_level: '36', warcraft_logs_link: 'http://warcraftlogs.com', item_level: '396', avg_mythic_parse: '12', avg_heroic_parse: '123',avg_normal_parse: '61', role: 'tank', player_class: 'Demon Hunter', player_name: 'Doopsq')

  roster0 = Roster.create!(
    user: user,
    roster_name: 'cindertwerkz',
  )
  roster1= Roster.create!(
    user: user,
    roster_name: 'cinderworks',
    players: [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18, player19, player20]
  )
  roster2 = Roster.create!(
    user: user,
    roster_name: 'cindertwerks',
    players: [player1, player3]
  )
end
