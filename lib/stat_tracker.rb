require 'pry'
require 'csv'
require './lib/teams'
require './lib/games'
require './lib/coaches'

class StatTracker
  attr_reader :teams, :games, :game_teams

  def initialize(teams, games, game_teams)
    @teams = teams
    @games = games
    @game_teams = game_teams
  end

  def self.from_csv(csv_paths)
    teams_array = []
    games_array = []
    game_teams_array = []

    teams = CSV.read(csv_paths[:teams], headers: true, header_converters: :symbol) 

    CSV.foreach('./data/teams.csv', headers: true, header_converters: :symbol) do |team|
      teams_array << Teams.new(team[:team_id], team[:franchiseid], team[:teamname], team[:abbreviation], team[:stadium], team[:link])
    end

    games = CSV.read(csv_paths[:games], headers: true, header_converters: :symbol) 

    CSV.foreach('./data/games.csv', headers: true, header_converters: :symbol) do |game|
      games_array << Games.new(game[:game_id], game[:season], game[:type], game[:date_time], game[:away_team_id], game[:home_team_id], game[:away_goals], game[:home_goals], game[:venue], game[:venue_link])
    end

    game_teams = CSV.read(csv_paths[:game_teams], headers: true, header_converters: :symbol)

    CSV.foreach('./data/game_teams.csv', headers: true, header_converters: :symbol) do |coach|
      game_teams_array << Coaches.new(coach[:team_id], coach[:hoa], coach[:result], coach[:settled_in], coach[:head_coach], coach[:goals], coach[:shots], coach[:tackles], coach[:pim], coach[:powerplayopportunities], coach[:powerplaygoals], coach[:faceoffwinpercentage], coach[:giveaways], coach[:takeaways])
    end
  end
end