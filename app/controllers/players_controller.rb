require 'http'
require_relative './../clients/blizzardClient'
require_relative './../clients/warcraftLogsClient'
class PlayersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def show

  end

  def create
    bClient = BlizzardClient.new
    wlClient = WarcraftLogsClient.new
    playerName = params.require(:playerName)
    realm = params.require(:realm)
    roster_name = params.require(:roster_name)

    playerData = bClient.fetchPlayer(playerName, realm)
    parseData = wlClient.fetchPlayer(playerName, realm)

    if playerData == -1
      return
    end

    processedParses = processParses(parseData)
    puts processedParses

    itemLevel = playerData['items']['averageItemLevelEquipped']
    playerName = playerData['name']

    classNumber = playerData['class']
    playerClass = numToClass(classNumber)

    neck = playerData['items']['neck']['azeriteItem']
    neckLevel = neck['azeriteLevel'].to_f
    neckPercent = neck['azeriteExperience'].to_f/neck['azeriteExperienceRemaining'].to_f
    neckLevel = neckLevel + neckPercent
    neckLevel = neckLevel.to_s[0,5]

    player = Player.create!(
      heart_level: neckLevel,
      warcraft_logs_link: 'http://warcraftlogs.com',
      item_level: itemLevel,
      avg_normal_parse: processedParses[:normalAvg].to_s[0,5],
      avg_heroic_parse: processedParses[:heroicAvg].to_s[0,5],
      avg_mythic_parse: processedParses[:mythicAvg].to_s[0,5],
      role: 'dps',
      player_class: playerClass,
      player_name: playerName,
    )
    player.rosters << Roster.find_by(roster_name: roster_name)
  end

  def destroy
    playerName = params.require(:playerName)
    roster_name = params.require(:roster_name)
    Player.find_by(player_name: playerName).destroy
    puts playerName
  end
end

def numToClass(classNumber)
  if classNumber == 1
    "Warrior"
  elsif classNumber == 2
    "Paladin"
  elsif classNumber == 3
    "Hunter"
  elsif classNumber == 4
    "Rogue"
  elsif classNumber == 5
    "Priest"
  elsif classNumber == 6
    "Death Knight"
  elsif classNumber == 7
    "Shaman"
  elsif classNumber == 8
    "Mage"
  elsif classNumber == 9
    "Warlock"
  elsif classNumber == 10
    "Monk"
  elsif classNumber == 11
    "Druid"
  elsif classNumber == 12
    "Demon Hunter"
  end
end

def processParses(parses)
  normalMap = {}
  heroicMap = {}
  mythicMap = {}
  parses.each do |parse|
    encounter = parse['encounterName']
    difficulty = parse['difficulty']

    if difficulty == 3
      if !normalMap[encounter]
        normalMap[encounter] = parse['percentile']
      elsif parse['percentile'] > normalMap[encounter]
        normalMap[encounter] = parse['percentile']
      end
    end

    if difficulty == 4
      if !heroicMap[encounter]
        heroicMap[encounter] = parse['percentile']
      elsif parse['percentile'] > heroicMap[encounter]
        heroicMap[encounter] = parse['percentile']
      end
    end

    if difficulty == 5
      if !mythicMap[encounter]
        mythicMap[encounter] = parse['percentile']
      elsif parse['percentile'] > mythicMap[encounter]
        mythicMap[encounter] = parse['percentile']
      end
    end


    # puts encounter
    # puts parse['percentile']
  end
  # puts normalMap
  normalAvg = calculateAverageParse(normalMap)
  # puts heroicMap
  heroicAvg = calculateAverageParse(heroicMap)
  # puts mythicMap
  mythicAvg = calculateAverageParse(mythicMap)
  allParses = { normalAvg: normalAvg, heroicAvg: heroicAvg, mythicAvg: mythicAvg }
  return allParses

end

def calculateAverageParse(parses)
  total = 0.0
  counter = 0.0
  parses.each {|key, value|
    total = total + value
    counter = counter + 1
  }
  if counter == 0
    return 0
  end
  return total/counter
end
