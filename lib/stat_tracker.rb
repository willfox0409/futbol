require 'csv'
require 'pry'
require_relative './team'
require_relative './game'
require_relative './game_team'
require_relative './game_statistics'
require_relative './team_statistics'

class StatTracker
  attr_reader :teams, :games, :game_teams, :game_statistics, :team_statistics

  def initialize(teams, games, game_teams)
    @teams = teams
    @games = games
    @game_teams = game_teams
    @game_statistics = GameStatistics.new(games)
    @team_statistics = TeamStatistics.new(teams, game_teams)
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

  def count_of_teams
    @teams.count 
  end

  def winningest_coach(season)
    num_of_win = Hash.new(0)
    @game_teams.each do |game_team|
      if season[0,4] == game_team.game_id[0,4] && game_team.result == "WIN"
        num_of_win[game_team.head_coach] += 1
      end
    end

    num_of_win.each do |coach, wins|
      count_of_games_by_season.each do |s|
        if s[0] == season
          num_of_win[coach] = (wins / s[1].to_f * 100).round(2)
        end
      end
    end
    return winning_coach = num_of_win.key(num_of_win.values.max)
  end

  def worst_coach(season)
    num_of_loss = Hash.new(0)
    @game_teams.each do |game_team|
      if season[0,4] == game_team.game_id[0,4] && game_team.result == "LOSS"
        num_of_loss[game_team.head_coach] += 1
      end
    end

    num_of_loss.each do |coach, loss|
      count_of_games_by_season.each do |s|
        if s[0] == season
          num_of_loss[coach] = (loss / s[1].to_f * 100).round(2)
        end
      end
    end
    return losing_coach = num_of_loss.key(num_of_loss.values.min)
  end
end