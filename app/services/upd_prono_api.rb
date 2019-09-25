
def contact_api(path_url)
  url = URI(path_url)

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'
  request["x-rapidapi-key"] = ENV["RAPIDAPI_KEY"]

  response = http.request(request)
  return JSON.parse(response.read_body)
end

@matches = Match.where("date > ?", Date.new(2019, 9, 1)).where("date < ?", Date.new(2019, 9, 30)).order(date: :desc)

# @matches.each do |match|
#   url_path =  "https://api-football-v1.p.rapidapi.com/v2/predictions/#{match.foot_api_fixture_id}"
#   p match.foot_api_fixture_id
# end

url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/216697"
test = contact_api(url_path)
p test["api"]["predictions"][0]["match_winner"]
p test["api"]["predictions"][0]["advice"]

url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/157854"
test = contact_api(url_path)
p test["api"]["predictions"][0]["match_winner"]
p test["api"]["predictions"][0]["advice"]

url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/157864"
test = contact_api(url_path)
p test["api"]["predictions"][0]["match_winner"]
p test["api"]["predictions"][0]["advice"]

url_path = "https://api-football-v1.p.rapidapi.com/v2/predictions/210703"
test = contact_api(url_path)
p test["api"]["predictions"][0]["match_winner"]
p test["api"]["predictions"][0]["advice"]

