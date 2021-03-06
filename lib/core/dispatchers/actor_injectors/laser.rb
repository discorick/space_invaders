module Laser 
  attr_accessor :x, :y, :alive, :collide

  def setup(window)
    @image = Gosu::Image.new(window, Constants::Weapon::GREEN_BULLET, false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @height = @width = 1
    @alive, @collide = true, false
  end

  def move
    @y += 3
  end

  def alive?
    @alive = false if @y >= 600
    @alive = false if @collide == true
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

end
