require_relative './spec_helper'
require './lib/stat_tracker'
require './lib/team_statistics.rb'

RSpec.describe GameStatistics do 
    before :each do
      @game_path = './data/games.csv'
      @team_path = './data/teams.csv'
      @game_teams_path = './data/game_teams.csv'
  
      locations = {
        games: @game_path,
        teams: @team_path,
        game_teams: @game_teams_path
      }
  
      @stat_tracker = StatTracker.from_csv(locations)
      @team_statistics = TeamStatistics.new(@teams, @game_teams)
    end

    describe '#initialize' do
        it 'is an instance of TeamStatistics' do

            expect(@team_statistics).to be_a(TeamStatistics)
        end

        it 'has access to the teams CSV' do

            expect(@team_statistics.teams).to eq(@teams)
        end
      
        it 'has access to the game_teams CSV' do

            expect(@team_statistics.game_teams).to eq(@game_teams)
        end
    end

    describe '#goals_per_team(game_teams)' do
        it 'calculates the average goals for a team' do

            game_teams = [
                double('GameTeam', team_id: 3, goals: 2),
                double('GameTeam', team_id: 3, goals: 2),
                double('GameTeam', team_id: 6, goals: 3),
                double('GameTeam', team_id: 6, goals: 4)
            ]

            expected = {
                3 => 2.0,
                6 => 3.5
            }

            expect(@team_statistics.goals_per_team(game_teams)).to eq(expected)
        end
    end

    describe '#get_team_name(team_id)' do
        it 'returns a teams name' do

            @teams = [
                double('Team', team_id: 3, teamName: 'Houston Dynamo'),
                double('Team', team_id: 6, teamName: 'FC Dallas')
            ]

            @team_statistics = TeamStatistics.new(@teams, [])

            expect(@team_statistics.get_team_name(3)).to eq("Houston Dynamo")
            expect(@team_statistics.get_team_name(6)).to eq("FC Dallas")
        end
    end

    describe '#best_offense' do
        it 'returns name of the team with the highest average number of goals scored per game across all seasons' do

            expect(@stat_tracker.best_offense).to be_a(String)
            expect(@stat_tracker.best_offense).to eq("Reign FC")
        end
    end

    describe '#worst_offense' do
        it 'returns name of the team with the lowest average number of goals scored per game across all seasons' do

            expect(@stat_tracker.worst_offense).to be_a(String)
            expect(@stat_tracker.worst_offense).to eq("Utah Royals FC")
        end
    end

    describe '#highest_scoring_visitor' do
        it 'returns the name of the team with the highest average score per game across all seasons when they are away' do

            expect(@stat_tracker.highest_scoring_visitor).to be_a(String)
            expect(@stat_tracker.highest_scoring_visitor).to eq("FC Dallas")
        end
    end

    describe '#highest_scoring_home_team' do
        it 'returns the name of the team with the highest average score per game across all seasons when they are home' do

            expect(@stat_tracker.highest_scoring_home_team).to be_a(String)
            expect(@stat_tracker.highest_scoring_home_team).to eq("Reign FC")
        end
    end  

    describe '#lowest_scoring_visitor' do
        it 'returns the name of the team with the lowest average score per game across all seasons when they are away' do

            expect(@stat_tracker.lowest_scoring_visitor).to be_a(String)
            expect(@stat_tracker.lowest_scoring_visitor).to eq("San Jose Earthquakes")
        end
    end

    describe '#lowest_scoring_home_team' do
        it 'returns the name of the team with the lowest average score per game across all seasons when they are home' do

            expect(@stat_tracker.lowest_scoring_home_team).to be_a(String)
            expect(@stat_tracker.lowest_scoring_home_team).to eq("Utah Royals FC")
        end
    end  
end