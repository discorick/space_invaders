module Bullet
  attr_accessor :x, :y

  def setup(window)
    @image = Gosu::Image.new(window, Constants::Weapon::GREEN_BULLET, false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def fire_now
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
    self.move
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 800
    @y %= 600

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

end
