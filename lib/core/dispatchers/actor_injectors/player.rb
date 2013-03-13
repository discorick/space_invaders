module Player
  attr_accessor :x, :y, :shots_fired

  def setup(window)
    @image = Gosu::Image.new(window, Constants::SpaceCraft::PLAYER, false)
    @x = @y = @angle = 0.0
    @shots_fired = []
  end

  def move_left
    @x -= 5
  end

  def move_right
    @x += 5 
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end