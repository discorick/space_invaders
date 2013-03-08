require_relative '../dispatchers/dispatcher.rb'
class SpaceEngine
  attr_reader :player_ship, :invader_army

  def initialize
    @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
    @invader_army = Dispatcher.dispatch(InvaderArmy.new) #add_invaders
  end

  def warp space_object, posix, posiy
    space_object.x, space_object.y = posix, posiy
  end

end
