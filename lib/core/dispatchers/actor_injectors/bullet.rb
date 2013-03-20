module Bullet
  attr_accessor :x, :y, :dead, :collide
  def setup(window)
    @image = Gosu::Image.new(window, Constants::Weapon::GREEN_BULLET, false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @height = @width = 1
    @dead, @collide = false, false
  end

  def move
    @y -= 5
  end

  def alive?
    @dead = true if @y <= 0 || @collide
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

end
