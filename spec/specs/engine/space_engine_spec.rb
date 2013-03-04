require 'spec_helper'

describe SpaceEngine do
  context "When Spinning up a game" do

    before(:all) do
      @space_arena = SpaceEngine.new
    end

    it "\n - Places the Players Ship" do
      @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
      @space_arena.move(@player_ship).to([9,0])
    end

  end
end
