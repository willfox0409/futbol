class TeamStatistics

    attr_reader :teams, :game_teams

    def initialize(teams, game_teams)
      @teams = teams
      @game_teams = game_teams
    end

    def goals_per_team(game_teams)
        team_goals = {}
        team_games = {}

        game_teams.each do |game_team|
            id = game_team.team_id
            goals = game_team.goals.to_i

            team_goals[id] ||= 0
            team_goals[id] += goals

            team_games[id] ||= 0
            team_games[id] += 1
        end

        average_goals_per_team = {}
        team_goals.each do |id, goals|
            average_goals_per_team[id] = (goals.to_f / team_games[id].to_f).round(2)
        end

        average_goals_per_team
    end

    def get_team_name(team_id)
        team = @teams.find do |team|
          team.team_id == team_id
        end
        team.teamName if team
    end

    def best_offense
        team_hash = goals_per_team(@game_teams)
        best = team_hash.max_by do |id, goals|
            goals
        end

        get_team_name(best[0])
    end
    
    def worst_offense
        team_hash = goals_per_team(@game_teams)
        worst = team_hash.min_by do |id, goals|
            goals
        end

        get_team_name(worst[0])
    end
    
    def highest_scoring_visitor
        away_goals = goals_per_team(@game_teams)
        highest_visitor = away_goals.max_by do |id, goals|
            goals
        end

        get_team_name(highest_visitor[0])
    end
    
    def highest_scoring_home_team
       home_goals = goals_per_team(@game_teams)
       highest_home = home_goals.max_by do |id, goals|
        goals
       end

       get_team_name(highest_home[0])
    end
    
    def lowest_scoring_visitor
        away_goals = goals_per_team(@game_teams)
        lowest_visitor = away_goals.min_by do |id, goals|
            goals
        end

        get_team_name(lowest_visitor[0])
    end
    
    def lowest_scoring_home_team
        home_goals = goals_per_team(@game_teams)
        lowest_home = home_goals.min_by do |id, goals|
            goals
       end

       get_team_name(lowest_home[0])
    end
end