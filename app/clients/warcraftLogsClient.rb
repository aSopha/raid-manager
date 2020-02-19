require 'http'
class WarcraftLogsClient
  def initialize
    puts "WL client start"
    @api_key = "87e0a1f302e740cbc8bce6c955e43309"
  end


  def fetchPlayer(playerName, realm)
    puts 'WL Fetch'
    req = "https://www.warcraftlogs.com:443/v1/rankings/character/#{playerName}/#{realm}/us?timeframe=historical&api_key=#{@api_key}"
    res = HTTP.get(
      req
    )
    if res.code != 200
      puts :'not good'
      return -1
    end
    data = JSON.parse(res.body)
    return data
  end
end
