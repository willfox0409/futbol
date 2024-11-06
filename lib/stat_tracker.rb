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
end