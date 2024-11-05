# require './spec_helper'
require './spec/stat_tracker_spec'

RSpec.describe StatTracker do 
  it "should exist" do
    @factory = StatTracker.new()
    expect(@factory).to be_a StatTracker
  end
end
