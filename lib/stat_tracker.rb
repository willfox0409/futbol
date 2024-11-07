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
    teams_data = CSV.read(locations[:teams], headers: true, header_converters: :symbol)
    teams_data.each do |row|
      team_data = {
        "team_id" => row[:team_id],
        "franchise_id" => row[:franchiseId],
        "team_name" => row[:teamName],
        "abbreviation" => row[:abbreviation],
        "stadium" => row[:Stadium],
        "link" => row[:link]
      }
      team = Team.new(team_data)
      teams << team
    end
  
    ###GAMES###
    games = []
    CSV.foreach(locations[:games], headers: true, header_converters: :symbol) do |row|
      game_data = {
        "game_id" => row[:game_id],
        "season" => row[:season],
        "type" => row[:type],
        "date_time" => row[:date_time],
        "away_team_id" => row[:away_team_id],
        "home_team_id" => row[:home_team_id],
        "away_goals" => row[:away_goals].to_i,
        "home_goals" => row[:home_goals].to_i,
        "venue" => row[:venue],
        "venue_link" => row[:venue_link]
      }
      game = Game.new(game_data)
      games << game
    end    

    ###GAME_TEAMS###
    game_teams = []
    game_teams_data = CSV.read(locations[:game_teams], headers: true, header_converters: :symbol) # Read CSV
    game_teams_data.each do |row|  # Now you can iterate over game_teams_data
      game_team_data = {
        "game_id" => row[:game_id],
        "team_id" => row[:team_id],
        "hoa" => row[:HoA],
        "result" => row[:result],
        "settled_in" => row[:settled_in],
        "head_coach" => row[:head_coach],
        "goals" => row[:goals].to_i,
        "shots" => row[:shots].to_i,
        "tackles" => row[:tackles].to_i,
        "pim" => row[:pim].to_i,
        "power_play_opps" => row[:powerPlayOpportunities].to_i,
        "power_play_goals" => row[:powerPlayGoals].to_i,
        "face_off_win_percentage" => row[:faceOffWinPercentage].to_f,
        "giveaways" => row[:giveaways].to_i,
        "takeaways" => row[:takeaways].to_i
      }
      game_team = GameTeam.new(game_team_data)
      game_teams << game_team
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
      total_score = game.away_goals + game.home_goals
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
      total_score = game.away_goals + game.home_goals
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
end