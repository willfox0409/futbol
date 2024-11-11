class SeasonStatistics
    attr_reader :teams, :game_teams
  
    def initialize(teams, game_teams)
      @teams = teams
      @game_teams = game_teams
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

        num_of_win.key(num_of_win.values.max)
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

        num_of_loss.key(num_of_loss.values.min)
    end
end