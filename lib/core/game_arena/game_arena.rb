require_relative 'keys.rb'

class GameArena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
    @background_image = Gosu::Image.new(self, Constants::Environment::BACKGROUND, true)

    init_space_objects 
  end

  def init_space_objects
    @space_engine = SpaceEngine.new

    @player_ship = @space_engine.player_ship
    @player_ship.setup self
    @space_engine.warp @space_engine.player_ship, 400, 500 

    #@bullet = @player_ship.weapon.fire
    #@bullet.setup_bullet self
    #@space_engine.warp @bullet, 450, 550 
  end

  def update
    #register events
    #execute events
    #@space_engine.register_event(event_to_register)
    Keys.bindings.each do |binding, command|
      @player_ship.send(command) if button_down? binding 
    end
  end

  def draw
    #draw events
    @player_ship.draw
    @background_image.draw(0,0,0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

