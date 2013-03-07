class SpaceEngine

  attr_reader :player_ship, :invader_army

  def initialize
    @arena = Arena.new
    @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
    @invader_army = Dispatcher.dispatch(InvaderArmy.new) #add_invaders
  end

end
