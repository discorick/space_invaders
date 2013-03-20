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
    @invader_army.setup
    @invader_army.x, @invader_army.y = 175, 200
    @invaders = @invader_army.invaders
    3.times{|group| @invader_army.add_invader_group(group,10)}
    equip_invaders
    process_invaders 
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
    @invaders.each{|group| group.each do |invader|
      index = @invaders.index(group)
      invader_index = @invaders[index].index(invader)
      invader.obstructed = false if index == 0
      if index > 0 
        invader.obstructed = false if @invaders[index - 1][invader_index].dead 
      end
    end}
  end

  def process_invader_shots
    @invader_army.each{|invader| invader.each do |sf|
      sf.alive?
      invader.shots_fired.delete sf unless sf.alive
      sf.move if sf.alive
    end}
  end

  private

  def process_invaders(y = (@invader_army.y + 50))
    @invaders.each do |group|
      y -= 50
      x = @invader_army.x - 50
      group.each do |invader|
        x += 50
        invader.setup @window, ("type#{@invader_army.invaders.index(group) + 1}").to_sym
        invader.x, invader.y = x,y
      end
    end
  end

  def equip_invaders
    @invader_army.each do |invader|
      invader.weapon = Dispatcher.dispatch(Weapon.new)
      invader.weapon.change_to :laser_gun
    end
  end

end
