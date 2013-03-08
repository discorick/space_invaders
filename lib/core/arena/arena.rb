require 'gosu'

class Arena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
    @background_image = Gosu::Image.new(self, Constants::Environment::BACKGROUND, true)

    @space_engine = SpaceEngine.new
    @player_ship = @space_engine.player_ship
    @player_ship.setup_player self
    @space_engine.warp @player_ship, 400, 500 
  end

  def update
    if button_down? Gosu::KbLeft then @player_ship.turn_left
    end
    if button_down? Gosu::KbRight then @player_ship.turn_right
    end
  end

  def draw
    @player_ship.draw
    @background_image.draw(0,0,0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

