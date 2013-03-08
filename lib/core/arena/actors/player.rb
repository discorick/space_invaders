module Player
  attr_accessor :x, :y

  def setup_player(window)
    @image = Gosu::Image.new(window, Constants::SpaceCraft::PLAYER, false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def turn_left
    @x -= 5
  end

  def turn_right
    @x += 5 
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
