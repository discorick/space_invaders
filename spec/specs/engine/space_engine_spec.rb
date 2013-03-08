require 'spec_helper'

describe SpaceEngine do
  context "When Spinning up an New Game Environment" do

    before(:all) do
      @space_arena = SpaceEngine.new
      @player_ship = @space_arena.player_ship
      fake_class Player
    end

    it "\n - Should Should Warp Objects to Position" do
      @space_arena.warp @player_ship, 100, 200
      @player_ship.x.should == 100
      @player_ship.y.should == 200
    end
    
  end
end
