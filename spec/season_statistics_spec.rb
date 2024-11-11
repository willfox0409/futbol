require_relative './spec_helper'
require './lib/stat_tracker'
require './lib/season_statistics.rb'

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
    @season_statistics = SeasonStatistics.new(@teams, @game_teams)
  end

  describe '#initialize' do
    it 'is an instance of GameStatistics' do

      expect(@season_statistics).to be_a(SeasonStatistics)
    end

    it 'has access to the teams CSV' do

      expect(@season_statistics.teams).to eq(@teams)
    end

    it 'has access to the game_teams CSV' do

      expect(@season_statistics.game_teams).to eq(@game_teams)
    end
  end

  describe '#count_of_teams' do
    it 'counts the total number of teams in the data' do

      expect(@stat_tracker.count_of_teams).to be_a(Integer)
      expect(@stat_tracker.count_of_teams).to eq(32)
    end
  end

  describe '#winningest_coach(season)' do
    it 'returns the name of the Coach with the best win percentage for the season' do
      season = "20132014"

      expect(@stat_tracker.winningest_coach(season)).to be_a(String)
      expect(@stat_tracker.winningest_coach("20132014")).to eq("Claude Julien")
      expect(@stat_tracker.winningest_coach("20142015")).to eq("Alain Vigneault")
    end
  end

  describe '#worst_coach(season)' do
    it 'returns the name of the Coach with the worst win percentage for the season' do
      season = "20132014"

      expect(@stat_tracker.worst_coach(season)).to be_a(String)
      expect(@stat_tracker.worst_coach("20132014")).to eq("Peter Laviolette")
      expect(@stat_tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end
end