require_relative '../dispatchers/dispatcher.rb'
class SpaceEngine
  attr_accessor :player_ship, :invader_army, :window, :level, :flag_global

  def initialize window
    @window = window
    set_global_conditions
    setup_new_game
  end

  def setup_new_game
    @player_ship = Dispatcher.dispatch(SpaceShip.new){ :player_ship }
    @level = 0
    new_level
  end

  def set_global_conditions
    @conditions = {:next_level => lambda{new_level},
                   :game_over => lambda {game_over},
                   :do_nothing => lambda { }}
    @flag_global = :do_nothing
  end

  def run_global_conditions
    @conditions[@flag_global].call
    @flag_global = :do_nothing
  end

  def new_level
    @level += 1
    @invader_army = Dispatcher.dispatch(InvaderArmy.new){ :army_container }
    setup_invader_army 
    @invader_army.each{ |invader| invader.weapon_speed -= @level * 75}
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
    @invader_army.each do |invader|
      invader.obstructed = false if invader.index[0] == 2
      if invader.index[0] < 2 
        invader.obstructed = false if @invaders[(invader.index[0] + 1)][invader.index[1]].dead
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
