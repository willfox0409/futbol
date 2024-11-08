require 'csv'
require 'pry'
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
        
  #####HIGHEST SCORE####
  def highest_total_score
    # set to the lowest possible score first
    highest_score = 0
     # Iterate through each game 
     @games.each do |game|
      total_score = game.away_goals.to_i + game.home_goals.to_i
      # Update highest_score if the total_score is greater
      highest_score = total_score if total_score > highest_score
    end
    highest_score
  end

  ####LOWEST SCORE####
  def lowest_total_score
    # set to something insanely high
    lowest_score = 99
    # iterate through each game
    @games.each do |game|
      total_score = game.away_goals.to_i + game.home_goals.to_i
      # update lowest_score if total_score is LOWER
      lowest_score = total_score if total_score < lowest_score
    end
    lowest_score
  end

  ####PERCENTAGE HOME WINS####
  def percentage_home_wins
    #first count how many home goals are higher than away
    home_wins = @games.count do |game|
      game.home_goals > game.away_goals
    end
    #then count how many total games have been played
    total_games = @games.count
    #calculate the percentage of home wins & round to 2 decimal places
    (home_wins.to_f / total_games).round(2)
  end

  ####PERCENTAGE VISITOR WINS###
  def percentage_visitor_wins
    #count how many away goals are higher
    away_wins = @games.count do |game|
      game.away_goals > game.home_goals
    end
    #copy total games
    total_games = @games.count
    #calculate percentage & round to 2 decimal places
    (away_wins.to_f / total_games).round(2)
  end

  ####PERCENTAGE TIE WINS####
  def percentage_ties
    #first calculate away == home wins
    ties = @games.count do |game|
      game.home_goals == game.away_goals
    end
    #include total game count
    total_games = @games.count
    #calculate percentage, rounded 2 places
    (ties.to_f / total_games).round(2)
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

  def best_offense
    team_hash = {}
    team_games = {}

    @game_teams.each do |game_team|
      id = game_team.team_id
      goals = game_team.goals

      if team_hash[id]
        team_hash[id] += goals.to_i
        team_games[id] += 1
      else
        team_hash[id] = goals.to_i
        team_games[id] = 1
      end
    end

    team_hash.each do |id, goals|
      team_hash[id] = (goals.to_f / team_games[id].to_f).round(2)
    end

    best = team_hash.max_by do |id, goals|
      goals
    end
    best
   
    @teams.each do |team|
      if team.team_id == best[0]
        return team.teamName
      end
    end
  end
end

