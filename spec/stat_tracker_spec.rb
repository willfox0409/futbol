# require './spec_helper'
require './lib/stat_tracker'

RSpec.describe StatTracker do 
  before :each do
    @stat_tracker = StatTracker.new('./data/games.csv', './data/teams.csv', './data/game_teams.csv')
  end

  it "should exist" do
    expect(@stat_tracker).to be_a StatTracker
  end
end
