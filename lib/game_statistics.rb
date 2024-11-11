class GameStatistics

    attr_reader :games
    
    def initialize(games)
        @games = games
    end

    def highest_total_score
        highest_score = 0
         @games.each do |game|
          total_score = game.away_goals.to_i + game.home_goals.to_i
          highest_score = total_score if total_score > highest_score
        end
        highest_score
    end

    def lowest_total_score
        lowest_score = 99
        @games.each do |game|
          total_score = game.away_goals.to_i + game.home_goals.to_i
          lowest_score = total_score if total_score < lowest_score
        end
        lowest_score
    end

    def percentage_home_wins
        total_games = @games.count
        home_wins = @games.count do |game|
          game.home_goals > game.away_goals
        end
        (home_wins.to_f / total_games).round(2)
    end

    def percentage_visitor_wins
        total_games = @games.count
        away_wins = @games.count do |game|
          game.away_goals > game.home_goals
        end
        (away_wins.to_f / total_games).round(2)
    end
    

    def percentage_ties
        total_games = @games.count
        ties = @games.count do |game|
          game.home_goals == game.away_goals
        end
        (ties.to_f / total_games).round(2)
    end
    
    def count_of_games_by_season
        season_hash = {}
        @games.each do |game|
            season_hash[game.season] = season_hash.fetch(game.season, 0) + 1
        end
        season_hash
    end

    def average_goals_per_game
        total_goals = 0
        @games.each do |game|
            total_goals += game.away_goals.to_i + game.home_goals.to_i
        end
        average = (total_goals.to_f / @games.count.to_f).round(2)
        average
    end

    def average_goals_by_season
        average_per_season = {}

        @games.each do |game|
            season = game.season
            goals = game.away_goals.to_f + game.home_goals.to_f

            average_per_season[season] ||= [0, 0]
            average_per_season[season][0] += goals
            average_per_season[season][1] += 1
        end

        average_per_season.transform_values do |values|
            (values[0] / values[1]).round(2)
        end
    end
end