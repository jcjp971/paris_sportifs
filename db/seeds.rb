if BetSite.count == 0
  p "Création des sites de références"
  site1 = BetSite.new
  site1.name = "Pronostics Gagnants.fr"
  site1.url = "http://www.pronostics-gagnants.fr"
  site1.logo = "http://www.pronostics-gagnants.fr/wp-content/uploads/2018/03/logo-PG-1.png"
  site1.save!

  site2 = BetSite.new
  site2.name = "SportyTrader - Win together"
  site2.url = "https://www.sportytrader.com"
  site2.logo = "https://www.sportytrader.com/dist/img/st_orange.png"
  site2.save!

  site3 = BetSite.new
  site3.name = "API-FOOTBALL"
  site3.url = "https://rapidapi.com/api-sports/api/api-football"
  site3.logo = "https://s3.amazonaws.com/mashape-production-logos/apis/5b3e61a1e4b0a5b0626e8bec_medium"
  site3.save!

end

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

def the_score_is(home_team, home_goal, away_team, away_goal, date)
  return home_team if home_goal > away_goal

  return away_team if home_goal < away_goal

  return date > Date.today ? "A venir" : "Match nul"
end

["2017", "2018", "2019"].each do |year|
  # creation des ligues et championnats
  championships = contact_api("https://api-football-v1.p.rapidapi.com/v2/leagues/country/france/#{year}")
  championships["api"]["leagues"].each do |league|
    if Championship.where(name: league["name"]).empty?
      p "Création de #{league["name"]} en #{year}"
      ligue = Championship.new
      ligue.name = league["name"]
      ligue.foot_api_league_key = league["league_id"]
      ligue.country_code = league["country_code"]
      ligue.save!
    else
      p "Modification ApiID de #{league["name"]} pour #{year}"
      ligue = Championship.where(name: league["name"]).first
      ligue.foot_api_league_key = league["league_id"]
      ligue.save!
    end
  end

  # creation des equipes de chaque championnats/ligue
  Championship.all.each do |league|
    teams = contact_api("https://api-football-v1.p.rapidapi.com/v2/teams/league/#{league.foot_api_league_key}")
    teams["api"]["teams"].each do |team|
      if Team.where(name: team["name"]).empty?
        newteam = Team.new
        p "création de #{team["name"]} en #{year}"
        newteam.name = team["name"]
        newteam.foot_api_team_id = team["team_id"]
        newteam.logo = team["logo"]
        newteam.save!
      else
        newteam = Team.where(name: team["name"]).first
        if newteam.foot_api_team_id != team["team_id"]
          newteam.foot_api_team_id = team["team_id"]
          p "modification de ApiID de #{team["name"]} en #{year}"
          newteam.save!
        end
      end
    end

    # creation des matchs de chaque ligue
    rounds = contact_api("https://api-football-v1.p.rapidapi.com/v2/fixtures/rounds/#{league.foot_api_league_key}")
    rounds['api']['fixtures'].each do |round|
      infos = contact_api("https://api-football-v1.p.rapidapi.com/v2/fixtures/league/#{league.foot_api_league_key}/#{round}")
      infos['api']['fixtures'].each do |info|
        newmatch = Match.new
        newmatch.date = info['event_date'].to_date
        newmatch.team1 = Team.where(foot_api_team_id: info['homeTeam']['team_id'].to_i).first
        newmatch.team2 = Team.where(foot_api_team_id: info['awayTeam']['team_id'].to_i).first
        newmatch.championship = league
        newmatch.foot_api_fixture_id = info['fixture_id']
        p "le #{newmatch.date} -> #{newmatch.team1.name} vs #{newmatch.team2.name}"
        goals_home_team = info['goalsHomeTeam'].to_i
        goals_away_team = info['goalsAwayTeam'].to_i
        newmatch.result = the_score_is(newmatch.team1.name, goals_home_team, newmatch.team2.name, goals_away_team, newmatch.date)
        puts " existe deja #{league.foot_api_league_key} #{round} " unless newmatch.save
      end
    end
  end
end
