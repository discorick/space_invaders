require_relative '../dispatchers/dispatcher.rb'
class SpaceEngine
  attr_reader :player_ship, :invader_army

  def initialize 
    @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
    @invader_army = Dispatcher.dispatch(InvaderArmy.new) #add_invaders
    @orders = Dispatcher.dispatch(Orders.new){ :spaceship_orders }
  end

  def warp space_object, posix, posiy
    space_object.x, space_object.y = posix, posiy
  end

  def execute_order order
    (@orders.act_on order).call
  end

end
