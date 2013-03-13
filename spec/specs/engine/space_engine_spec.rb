require 'spec_helper'

describe SpaceEngine do
  context "When Spinning up an New Game Environment" do

    before(:each) do
      @space_arena = SpaceEngine.new
      @player_ship = @space_arena.player_ship
    end

    it "\n - Should Init Space Objects" do
      @player_ship.class.should be SpaceShip
    end

  end

  context "An existing Game Environment" do
    
    before(:each) do
      @space_arena = SpaceEngine.new 
      @player_ship = @space_arena.player_ship
    end

    it "\n - Should Should Warp Objects to Position" do
      @space_arena.warp @player_ship, 100, 200
      @player_ship.x.should == 100
      @player_ship.y.should == 200
    end

  end
end
