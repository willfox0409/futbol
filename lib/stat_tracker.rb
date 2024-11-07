require 'pry'
require 'csv'
require_relative './team'
require_relative './game'
require_relative './game_team'

class StatTracker
  attr_reader :teams, :games, :game_teams

  def initialize(teams, games, game_teams)
    @teams = teams
    @games = games
    @game_teams = game_teams
  end

  def self.from_csv(locations)
    teams = []
    teams_data = CSV.read(locations[:teams], headers: true)
    teams_data.each do |row|
      teams << Team.new(row)
    end
    
    games = []
    games_data = CSV.read(locations[:games], headers: true)
    games_data.each do |row|
      games << Game.new(row)
    end

    game_teams = []
    game_teams_data = CSV.read(locations[:game_teams], headers: true)
    game_teams_data.each do |row|
      game_teams << GameTeam.new(row)
    end
    
    return StatTracker.new(teams, games, game_teams)
  end

  def inspect
    "#<#{self.class.name}:#{self.object_id} "
  end

  def count_of_games_by_season
    season_hash = {}
    @games.each do |game|
      if season_hash[game.season]
        season_hash[game.season] += 1
      else
        season_hash[game.season] = 1
      end
    end
    season_hash
  end

  def average_goals_per_game
    total_goals = 0
    @games.each do |game|
      total_goals += game.away_goals.to_i + game.home_goals.to_i
    end
    average = (total_goals.to_f / @games.count.to_f).round(2)
  end

  def average_goals_by_season
    average_per_season = {}
    games_per_season = {}

    @games.each do |game|
      season = game.season
      goals = game.away_goals.to_f + game.home_goals.to_f

      if average_per_season[season]
        average_per_season[season] += goals
        games_per_season[season] += 1
      else
        average_per_season[season] = goals
        games_per_season[season] = 1
      end
    end

    average_per_season.each do |season, goals|
      average_per_season[season] = (goals.to_f / games_per_season[season].to_f).round(2)
    end

    average_per_season
  end

  def count_of_teams
    all_teams = []
    @teams.each do |team|
      all_teams << team
    end
    all_teams.count
  end
end