require 'csv'
require 'pry'
  
class Coach
  attr_reader :game_id, :team_id, :hoa, :result, :settled_in, :head_coach, :goals, :shots, :tackles, :pim, :power_play_opportunities, :power_play_goals, :face_off_win_percentage, :give_aways, :take_aways

  def initialize(data)
    @game_id = data["game_id"]
    @team_id = data["team_id"]
    @hoa = data["hoa"]
    @result = data["result"]
    @settled_in = data["settled_in"]
    @head_coach = data["head_coach"]
    @goals = data["goals"]
    @shots = data["shots"]
    @tackles = data["tackles"]
    @pim = data["pim"]
    @power_play_opportunities = data["power_play_opportunities"]
    @power_play_goals = data["power_play_goals"]
    @face_off_win_percentage = data["face_off_win_percentage"]
    @give_aways = data["give_aways"]
    @take_aways = data["take_aways"]
  end
end
