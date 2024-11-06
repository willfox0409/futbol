require 'csv'
require 'pry'
require_relative './stat_tracker'

class Team
  attr_reader :team_id, :franchiseId, :teamName, :abbreviation, :Stadium, :link

  def initialize(data)
    @team_id = data["team_id"]
    @franchiseid = data["franchiseId"]
    @teamname = data["teamName"]
    @abbreviation = data["abbreviation"]
    @stadium = data["Stadium"]
    @link = data["link"]
  end
end