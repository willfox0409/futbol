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
  end
end