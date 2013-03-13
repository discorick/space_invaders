require_relative '../dispatchers/dispatcher.rb'
class SpaceEngine
  attr_reader :player_ship, :invader_army

  def initialize 
    @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
    @invader_army = Dispatcher.dispatch(InvaderArmy.new) 
  end

  def warp space_object, posix, posiy
    space_object.x, space_object.y = posix, posiy
  end

  def setup_player window
    @player_ship.setup window
    @player_ship.x, @player_ship.y = 400,500
    @player_ship
  end

  def player_fire window
    projectile = Dispatcher.dispatch(Projectile.new){ @player_ship.weapon.fire } 
    projectile.setup window
    projectile.x, projectile.y = @player_ship.x, (@player_ship.y - 15)
    projectile
  end

end
