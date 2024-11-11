require_relative './spec_helper'
require './lib/stat_tracker'
require './lib/game_statistics.rb'

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
  end

  describe '#highest_total_score' do
    it 'calculates the highest sum of the winning and losing teams scores' do

      expect(@stat_tracker.highest_total_score).to be_an(Integer)
      expect(@stat_tracker.highest_total_score).to eq(11)
    end
  end

  describe '#lowest_total_score' do
    it 'calculates the lowest sum of the winning and losing teams scores' do

      expect(@stat_tracker.lowest_total_score).to be_an(Integer)
      expect(@stat_tracker.lowest_total_score).to eq(0)
    end
  end

  describe '#percentage_home_wins' do
    it 'calculates the percentage of games that a home team has won' do

      expect(@stat_tracker.percentage_home_wins).to be_a(Float)
      expect(@stat_tracker.percentage_home_wins).to eq(0.44)
    end
  end

  describe '#percentage_visitor_wins' do
    it 'calculates the percentage of games that a visitor has won' do

      expect(@stat_tracker.percentage_visitor_wins).to be_a(Float)
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
    end
  end

  describe '#percentage_ties' do
    it 'calculates the percentage of games that resulted in a tie' do

      expect(@stat_tracker.percentage_ties).to be_a(Float)
      expect(@stat_tracker.percentage_ties).to eq(0.20)
    end
  end

  describe '#count_of_games_by_season' do
    it 'returns a hash with season names as keys and counts of games as values' do
      expected = expected = {
        "20122013"=>806,
        "20162017"=>1317,
        "20142015"=>1319,
        "20152016"=>1321,
        "20132014"=>1323,
        "20172018"=>1355
      }

      expect(@stat_tracker.count_of_games_by_season).to be_a(Hash)
      expect(@stat_tracker.count_of_games_by_season).to eq(expected)
    end
  end

  describe '#average_goals_per_game' do
    it 'calculates the average number of goals scored in a game across all seasons including both home and away goals' do

      expect(@stat_tracker.average_goals_per_game).to be_a(Float)
      expect(@stat_tracker.average_goals_per_game).to eq(4.22)
    end
  end

  describe '#average_goals_by_season' do
    it 'calculates the average number of goals scored in a game organized in a hash with season names as keys and a float representing the average number of goals in a game for that season as values' do
      expected = expected = {
        "20122013"=>4.12,
        "20162017"=>4.23,
        "20142015"=>4.14,
        "20152016"=>4.16,
        "20132014"=>4.19,
        "20172018"=>4.44
      }

      expect(@stat_tracker.average_goals_by_season).to be_a(Hash)
      expect(@stat_tracker.average_goals_by_season).to eq(expected)
    end
  end
end