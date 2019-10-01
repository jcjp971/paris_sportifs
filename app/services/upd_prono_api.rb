
# def contact_api(path_url)
#   url = URI(path_url)

#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url)
#   request["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'
#   request["x-rapidapi-key"] = ENV["RAPIDAPI_KEY"]

#   response = http.request(request)
#   return JSON.parse(response.read_body)
# end

# @matches = Match.joins(:championship).where("championships.name = ?", 'Ligue 1').where("date > ?", Date.new(2019, 9, 1)).where("date < ?", Date.new(2019, 9, 30)).order(date: :desc)

# @matches.each do |match|
#   url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/#{match.foot_api_fixture_id}"
#   from_api = contact_api(url_path)
#   prono = Pronostic.new
#   prono.prono_site = PronoSite.where(name: "API-FOOTBALL").first
#   prono.match = match
#   prono.date = Date.today
#   prono.double_chance = from_api["api"]["predictions"][0]["match_winner"].length > 1
#   prono.prediction = from_api["api"]["predictions"][0]["match_winner"]
#   prono.advice = from_api["api"]["predictions"][0]["advice"]
#   prono.save!
# end

# url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/216697"
# test = contact_api(url_path)
# p test["api"]["predictions"][0]["match_winner"].length
# p test["api"]["predictions"][0]["advice"]

# url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/157854"
# test = contact_api(url_path)
# p test["api"]["predictions"][0]["match_winner"].length
# p test["api"]["predictions"][0]["advice"]

# url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/157864"
# test = contact_api(url_path)
# p test["api"]["predictions"][0]["match_winner"]
# p test["api"]["predictions"][0]["advice"]

# url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/210703"
# test = contact_api(url_path)
# p test["api"]["predictions"][0]["match_winner"]
# p test["api"]["predictions"][0]["advice"]

