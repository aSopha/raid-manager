require 'http'
class BlizzardClient

  def initialize
    puts "blizz client start"
    @access_token = "USG5TxSpUCp426XOmXFVb2vuK1LTCXResu"
  end


  def fetchPlayer(playerName, realm)
    puts "Blizz Fetch"
    req = "https://us.api.blizzard.com/wow/character/#{realm}/#{playerName}?fields=items&locale=en_US&access_token=#{@access_token}"
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
