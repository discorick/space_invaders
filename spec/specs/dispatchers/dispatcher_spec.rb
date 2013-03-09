require 'spec_helper'

describe Dispatcher do
  context 'Dispatches Space Objects' do

    it "\n - Should Dispatch a Basic SpacesShip Object" do
      @simple_ship = Dispatcher.dispatch(SpaceShip.new)
      @simple_ship.weapon.should == :laser
      @simple_ship.size.should == [1,1]
      @simple_ship.lives.should == 1
    end

    it "\n - Should Dispatch a Player Ship" do
      @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
      @player_ship.weapon.type.should == :cannon
      @player_ship.size.should == [1,1]
      @player_ship.lives.should == 3
    end

  end
end
