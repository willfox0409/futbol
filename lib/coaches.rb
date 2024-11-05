require 'csv'
require 'pry'
  
class Coaches
  attr_reader :team_id, :hoa, :result, :settled_in, :head_coach, :goals, :shots, :tackles, :pim, :power_play_opportunities, :power_play_goals, :face_off_win_percentage, :give_aways, :take_aways

  def initialize(team_id, hoa, result, settled_in, head_coach, goals, shots, tackles, pim, power_play_opportunities, power_play_goals, face_off_win_percentage, give_aways, take_aways)
    @team_id = team_id
    @hoa = hoa
    @result = result
    @settled_in = settled_in
    @head_coach = head_coach
    @goals = goals
    @shots = shots
    @tackles = tackles
    @pim = pim
    @power_play_opportunities = power_play_opportunities
    @power_play_goals = power_play_goals
    @face_off_win_percentage = face_off_win_percentage.to_f
    @give_aways = give_aways
    @take_aways = take_aways
  end
end
