require_relative '../dispatchers/dispatcher.rb'
class SpaceEngine
  attr_accessor :player_ship, :invader_army, :window

  def initialize 
    @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
    @invader_army = Dispatcher.dispatch(InvaderArmy.new){ :army_container }
    @window = 'window'
  end

  def warp space_object, posix, posiy
    space_object.x, space_object.y = posix, posiy
  end

  def setup_player 
    @player_ship.setup @window
    @player_ship.x, @player_ship.y = 400,500
    @player_ship
  end

  def setup_invader_army 
    @invader_army.setup
    @invader_army.x, @invader_army.y = 175, 350
    3.times{|group| @invader_army.add_invader_group(group,10)}
    process_invaders 
    @invader_army
  end

  def move_invaders
    @invader_army.move 
    @invader_army.invaders.each{|group| group.each do |invader|
      invader.x += @invader_army.increment
      @invader_army.flag :reverse if invader.hits_border?
    end}
    @invader_army.check_flags
  end

  def player_fire 
    projectile = Dispatcher.dispatch(Projectile.new){ @player_ship.weapon.fire } 
    projectile.setup @window
    projectile.x, projectile.y = @player_ship.x, (@player_ship.y - 15)
    projectile
  end

  private

  def process_invaders(y = (@invader_army.y + 50))
    @invader_army.invaders.each do |group|
      y -= 50
      x = @invader_army.x - 50
      group.each do |invader|
        x += 50
        invader.setup @window, ("type#{@invader_army.invaders.index(group) + 1}").to_sym
        invader.x, invader.y = x,y
      end
    end
  end


end
