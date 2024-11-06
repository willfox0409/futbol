require 'pry'
require 'csv'
require './lib/teams'
require './lib/games'
require './lib/coaches'

class StatTracker
  attr_reader :teams, :games, :game_teams

  def initialize(locations)
    @teams = object_creation(locations[:teams], Team, :team_id)
    # binding.pry
    @games = object_creation(locations[:games], Game, :game_id)
    @game_teams = object_creation(locations[:game_teams], Coach, :game_id)
    binding.pry
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def object_creation(path, object_type, unique_attr)
    objects = CSV.read(path, headers: true).map { |row| object_type.new(row) }
    objects.uniq(&unique_attr)
    return objects
  end
end