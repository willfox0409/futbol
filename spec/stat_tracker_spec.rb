require_relative './spec_helper'
require './lib/stat_tracker'

RSpec.describe StatTracker do 
  before :each do
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'

    locations = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
    }

    # Load data into variables using from_csv
    @stat_tracker = StatTracker.from_csv(locations)
  end

  it "should exist" do
    expect(@stat_tracker).to be_a StatTracker
  end

  it "should have multiple teams" do
    #there should be at least one team
    expect(@stat_tracker.teams.count).to be > 0  
  end

  it "should have multiple games" do
    # there should be at least one game
    expect(@stat_tracker.games.count).to be > 0  
  end

  it "should have multiple game_teams" do
    #there should be at least one game_team
    expect(@stat_tracker.game_teams.count).to be > 0  
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

  describe '#count_of_teams' do
    it 'calculates the total number of teams in the data' do

      expect(@stat_tracker.count_of_teams).to be_a(Integer)
      expect(@stat_tracker.count_of_teams).to eq(32)
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