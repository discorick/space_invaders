require_relative 'keys.rb'

class GameArena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
    @background_image = Gosu::Image.new(self, Constants::Environment::BACKGROUND, true)

    @space_engine = SpaceEngine.new

    @player_ship = @space_engine.player_ship
    @player_ship.setup_player self
    @space_engine.warp @player_ship, 400, 500 

    @bullet = @player_ship.weapon.fire
    @bullet.setup_bullet self
    @space_engine.warp @bullet, 450, 550 
  end

  def init_space_object space_object

  end

  def update
    Keys.bindings.each do |binding, command|
      @player_ship.send(command) if button_down? binding 
    end
    @bullet.fire_now if button_down? Gosu::KbSpace 
  end

  def draw
    @player_ship.draw
    @bullet.draw
    @background_image.draw(0,0,0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

