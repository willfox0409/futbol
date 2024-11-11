require 'csv'
require 'pry'
require_relative './team'
require_relative './game'
require_relative './game_team'
require_relative './game_statistics'
require_relative './team_statistics'
require_relative './season_statistics'

class StatTracker
  attr_reader :teams, :games, :game_teams, :game_statistics, :team_statistics, :season_statistics

  def initialize(teams, games, game_teams)
    @teams = teams
    @games = games
    @game_teams = game_teams
    @game_statistics = GameStatistics.new(games)
    @team_statistics = TeamStatistics.new(teams, game_teams)
    @season_statistics = SeasonStatistics.new(teams, game_teams, games)
  end

  # Class method that reads CSV files and creates objects
  def self.from_csv(locations)
    ###TEAMS###
    teams = []
    teams_data = CSV.read(locations[:teams], headers: true)
    teams_data.each do |row|
      teams << Team.new(row)
    end

    ###GAMES###
    games = []
    games_data = CSV.read(locations[:games], headers: true)
    games_data.each do |row|
      games << Game.new(row)
    end

    ###GAME_TEAMS###
    game_teams = []
    game_teams_data = CSV.read(locations[:game_teams], headers: true)
    game_teams_data.each do |row|
      game_teams << GameTeam.new(row)
    end

    # Return the StatTracker instance with populated data
    StatTracker.new(teams, games, game_teams)
  end

  def inspect
    "#<#{self.class.name}:#{self.object_id} "
  end
  
  def highest_total_score
    @game_statistics.highest_total_score
  end

  def lowest_total_score
    @game_statistics.lowest_total_score
  end

  def percentage_home_wins
    @game_statistics.percentage_home_wins
  end

  def percentage_visitor_wins
    @game_statistics.percentage_visitor_wins
  end

  def percentage_ties
    @game_statistics.percentage_ties
  end

  def count_of_games_by_season
    @game_statistics.count_of_games_by_season
  end

  def average_goals_per_game
    @game_statistics.average_goals_per_game
  end

  def average_goals_by_season
    @game_statistics.average_goals_by_season
  end

  def best_offense
    @team_statistics.best_offense
  end

  def worst_offense
    @team_statistics.worst_offense
  end

  def highest_scoring_visitor
    @team_statistics.highest_scoring_visitor
  end

  def highest_scoring_home_team
    @team_statistics.highest_scoring_home_team
  end

  def lowest_scoring_visitor
    @team_statistics.lowest_scoring_visitor
  end

  def lowest_scoring_home_team
    @team_statistics.lowest_scoring_home_team
  end

  def count_of_teams
    @season_statistics.count_of_teams
  end

  def winningest_coach(season)
    @season_statistics.winningest_coach(season)
  end

  def worst_coach(season)
    @season_statistics.worst_coach(season)
  end
end