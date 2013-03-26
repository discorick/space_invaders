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

  ## Player Actions

  def setup_player 
    @player_ship.setup @window
    @player_ship.weapon = Dispatcher.dispatch(Weapon.new)
    @player_ship.x, @player_ship.y = 400,500
    @player_ship
  end

  def player_shot
    projectile = Dispatcher.dispatch(Projectile.new){ @player_ship.weapon.fire } 
    projectile.setup @window
    projectile.x, projectile.y = @player_ship.x, (@player_ship.y - 15)
    projectile
  end

  def process_player_shots
    @player_ship.each do |sf| 
      sf.alive?
      @player_ship.shots_fired.delete sf if sf.dead
      sf.move unless sf.dead
    end
  end


  ## Invader Actions

  def setup_invader_army 
    3.times{|group| @invader_army.add_invader_group(group,10)}
    @invader_army.setup @invader_army, @window
    @invaders = @invader_army.invaders
    @invader_army
  end

  def move_invaders
    @invader_army.move 
    @invader_army.each do |invader|
      invader.x += @invader_army.increment_x
      invader.y += @invader_army.increment_y
      @invader_army.flag :reverse if invader.hits_border?
    end
  end

  def invaders_fire
    @invader_army.each do |invader|
      invader.fire? invader.weapon.fire
    end
  end

  def invaders_unobstruct_clear_shots
    @invaders.each do |group|
      invader_row = @invader_army.invaders.index(group)
      group.each do |invader|
        invader_index = group.index(invader)
        invader.obstructed = false if invader_row == 2
        if invader_row < 2 
          invader.obstructed = false if @invaders[invader_row - 1][invader_index].dead 
        end
      end
    end
  end

  def process_invader_shots
    @invader_army.each{|invader| invader.each do |sf|
      sf.alive?
      invader.shots_fired.delete sf unless sf.alive
      sf.move if sf.alive
    end}
  end


end
